# daisyUI 5 Core Practices

**Setup**: `@import "tailwindcss"; @plugin "daisyui";` 

**Rules**:
- Component base class + modifiers: `btn btn-primary btn-lg`
- Customize with Tailwind utilities: `btn px-10`
- Force override only as last resort: `btn bg-red-500!`
- Always use responsive prefixes: `sm:btn-wide lg:menu-horizontal`
- Use semantic colors: `primary`, `error`, `base-100` (not `red-500`)
- No custom CSS - use daisyUI + Tailwind only

**Docs**: [daisyui.com](http://daisyui.com)
