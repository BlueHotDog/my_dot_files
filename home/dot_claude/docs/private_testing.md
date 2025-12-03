# Testing Practices

- Tests MUST cover the functionality being implemented
- NEVER ignore test output - logs often contain critical information
- Test output must be pristine to pass
- If logs should contain errors, capture and test them
- Every project needs unit, integration, AND e2e tests (unless explicitly authorized to skip)

## TDD Process

We practice Test-Driven Development:

1. Write a failing test that defines desired behavior
2. Run the test to confirm it fails as expected
3. Write minimal code to make the test pass
4. Run the test to confirm success
5. Refactor while keeping tests green
6. Repeat for each new feature or bugfix
