---
title: TailwindCSS with Astro
description: Best practices for using TailwindCSS v4.x with Astro.
references:
  - https://tailwindcss.com/blog/tailwindcss-v4
---

## Content

### Version

- **TailwindCSS v4.x**: All projects must use TailwindCSS v4.x.

### Configuration

- **CSS-first configuration**: Configure Tailwind directly in your CSS file using `@import "tailwindcss";` and CSS variables.
- **No `tailwind.config.js`**: Avoid using a `tailwind.config.js` file, as it is deprecated in v4.x.

### Project Setup

- Use the correct Tailwind configuration.
- Correctly configure theme extensions.
- Set up the correct purge configuration.
- Use the correct plugin integration.
- Configure custom spacing and breakpoints.
- Set up the correct color palette.

### Component Styling

- Use utility classes instead of custom CSS.
- Use `@apply` to group related utility classes when needed.
- Use the correct responsive design utility classes.
- Correctly implement dark mode.
- Use the correct state variants.
- Keep component styling consistent.

### Layout

- Use Flexbox and Grid utility classes effectively.
- Implement the correct spacing system.
- Use container queries when needed.
- Implement the correct responsive breakpoints.
- Use the correct padding and margin utility classes.
- Implement the correct alignment utility classes.

### Typography

- Use the correct font size utility classes.
- Implement the correct line height.
- Use the correct font weight utility classes.
- Correctly configure custom fonts.
- Use the correct text alignment.
- Implement the correct text decoration.

### Colors

- Use semantic color naming.
- Implement the correct color contrast.
- Use opacity utility classes effectively.
- Correctly configure custom colors.
- Use the correct gradient utility classes.
- Implement the correct hover states.

### Components

- Use shadcn/ui components when available.
- Correctly extend components.
- Keep component variants consistent.
- Implement the correct animations.
- Use the correct transition utility classes.
- Keep accessibility in mind.

### Responsive Design

- Use a mobile-first approach.
- Implement the correct breakpoints.
- Use container queries effectively.
- Correctly handle different screen sizes.
- Implement the correct responsive typography.
- Use the correct responsive spacing.

### Performance

- Use the correct purge configuration.
- Minimize custom CSS.
- Use the correct caching strategy.
- Implement the correct code splitting.
- Optimize for production.
- Monitor bundle size.

### Best Practices

- **Utility-First**: Embrace the utility-first workflow.
- **Composability**: Compose utilities to build complex components.
- **Consistency**: Use Tailwind's design tokens for a consistent UI.
- Follow naming conventions.
- Keep styles well-organized.
- Use the correct documentation.
- Implement the correct tests.
- Follow accessibility guidelines.
- Use the correct version control.