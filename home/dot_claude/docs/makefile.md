# Makefile Best Practices

This guide outlines the best practices for creating Makefiles in our monorepo, ensuring consistency and maintainability across all projects.

## Core Principles

Our Makefiles serve as the universal task runner across all projects, replacing language-specific tools like `npm run`, `mix`, `cargo run`, etc. This provides a consistent interface regardless of the underlying technology stack.

## 1. Self-Documenting Help System

Every Makefile should be self-documenting with an auto-generated help system:

```makefile
.DEFAULT_GOAL := help
.PHONY: help

help: ## Display this help message
	@printf "$(CYAN)Available commands:$(RESET)\n"
	@echo ""
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ { printf "  $(GREEN)%-15s$(RESET) %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
	@echo ""
```

**Key points:**
- Set `.DEFAULT_GOAL := help` so running `make` shows available commands
- Use `## comment` syntax after targets to create help descriptions
- The `awk` command automatically parses and formats these comments

Example target with documentation:
```makefile
build: ## Build the project for production
	@printf "$(YELLOW)Building project...$(RESET)\n"
	# Build commands here
```

## 2. Visual Feedback with Colors

Define color variables for consistent, readable output:

```makefile
# Colors for output
CYAN := \033[36m
GREEN := \033[32m
YELLOW := \033[33m
RESET := \033[0m
```

**Usage conventions:**
- `CYAN` - Informational messages (e.g., "Installing dependencies...")
- `GREEN` - Success messages (e.g., "Build complete!")
- `YELLOW` - Action/progress messages (e.g., "Running tests...")
- `RESET` - Return to normal color

Always use `@printf` with colors for user feedback:
```makefile
	@printf "$(YELLOW)Starting development server...$(RESET)\n"
```

## 3. Standard Target Structure

Organize targets logically and provide standard commands developers expect:

### Essential Targets
```makefile
install: ## Install project dependencies
test: ## Run test suite
lint: ## Run linters and code formatters
dev: ## Start development server
build: ## Build the project
clean: ## Clean build artifacts and temporary files
```

### Combination Targets
```makefile
check: lint test ## Run all checks (lint + test)
```

### Environment-Specific Targets
```makefile
db-migrate: ## Run database migrations
db-seed: ## Seed database with sample data
deploy: ## Deploy the application
logs: ## Show application logs
env: ## Setup environment variables
```

## 4. Dependency Management

Always check for required tools before using them:

```makefile
install: ## Install project dependencies
	@printf "$(YELLOW)Installing dependencies...$(RESET)\n"
	@if ! command -v mise &> /dev/null; then \
		printf "$(YELLOW)mise not found. Running bootstrap first...$(RESET)\n"; \
		$(MAKE) bootstrap; \
	fi
	@mise install
	# Project-specific install commands
```

## 5. Shell Configuration

Set consistent shell environment:

```makefile
# Variables
SHELL := /bin/bash
PATH := ./node_modules/.bin:$(PATH)
```

Always declare non-file targets as `.PHONY`:
```makefile
.PHONY: help install test lint dev build clean
```

## 6. Error Handling

Implement robust error handling:

```makefile
bootstrap: ## Install mise and other required dev tools
	@if ! command -v mise &> /dev/null; then \
		printf "$(CYAN)Installing mise...$(RESET)\n"; \
		curl https://mise.run | sh; \
		# ... additional setup
	else \
		printf "$(GREEN)mise is already installed$(RESET)\n"; \
	fi
```

## 7. Placeholder Structure

Include commented examples to guide implementation:

```makefile
test: ## Run test suite
	@printf "$(YELLOW)Running tests...$(RESET)\n"
	# Add your test commands here
	# npm test
	# mix test
	# cargo test
	# pytest
```

## 8. Naming Conventions

- Use lowercase with hyphens: `db-migrate` (not `db_migrate` or `dbMigrate`)
- Keep names short but descriptive
- Follow common conventions:
  - `dev` for development server (not `start` or `serve`)
  - `build` for production builds
  - `test` for running tests (not `tests`)
  - `lint` for code quality checks

## Example Makefile Template

```makefile
# Task runner Makefile with auto-generated help
# 
# Usage: make [target]
# Run 'make help' to see available commands

.DEFAULT_GOAL := help
.PHONY: help install test lint dev build clean check

# Colors for output
CYAN := \033[36m
GREEN := \033[32m
YELLOW := \033[33m
RESET := \033[0m

# Variables
SHELL := /bin/bash
PATH := ./node_modules/.bin:$(PATH)

help: ## Display this help message
	@printf "$(CYAN)Available commands:$(RESET)\n"
	@echo ""
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ { printf "  $(GREEN)%-15s$(RESET) %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
	@echo ""

install: ## Install project dependencies
	@printf "$(YELLOW)Installing dependencies...$(RESET)\n"
	# Add install commands

test: ## Run test suite
	@printf "$(YELLOW)Running tests...$(RESET)\n"
	# Add test commands

lint: ## Run linters and code formatters
	@printf "$(YELLOW)Running linters...$(RESET)\n"
	# Add lint commands

dev: ## Start development server
	@printf "$(YELLOW)Starting development server...$(RESET)\n"
	# Add dev server command

build: ## Build the project
	@printf "$(YELLOW)Building project...$(RESET)\n"
	# Add build commands

clean: ## Clean build artifacts and temporary files
	@printf "$(YELLOW)Cleaning up...$(RESET)\n"
	rm -rf build dist *.egg-info .pytest_cache __pycache__ node_modules

check: lint test ## Run all checks (lint + test)
	@printf "$(GREEN)All checks passed!$(RESET)\n"
```

## Benefits

This approach provides:
- **Consistency**: Same commands work across all projects
- **Discoverability**: `make help` shows all available commands
- **Clarity**: Color-coded output makes it easy to follow progress
- **Flexibility**: Easy to extend with project-specific targets
- **Simplicity**: No need to remember different commands for different tech stacks