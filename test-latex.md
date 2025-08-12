# LaTeX Math Rendering Test

## Inline Math
Here's some inline math: $E = mc^2$ and $\pi \approx 3.14159$.

You can also write inline formulas like $\sum_{i=1}^{n} x_i = x_1 + x_2 + \ldots + x_n$.

## Block Math

Here's a block equation:

$$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$$

And another one with fractions:

$$
\frac{d}{dx}\left( \int_{0}^{x} f(u) \, du\right) = f(x)
$$

## Matrix Example

$$
\begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix}
$$

## Complex Formula

$$
f(x) = \frac{1}{\sqrt{2\pi\sigma^2}} e^{-\frac{(x-\mu)^2}{2\sigma^2}}
$$

## Greek Letters and Symbols

- Alpha: $\alpha$, Beta: $\beta$, Gamma: $\gamma$
- Infinity: $\infty$, Plus-minus: $\pm$
- Partial derivatives: $\frac{\partial f}{\partial x}$

## Usage Instructions

1. Use `<leader>mp` to show LaTeX popup for the formula under cursor
2. Use `<leader>mt` to toggle virtual text rendering of LaTeX formulas
3. Use `<leader>mv` to toggle Markview rendering

Remember to have your cursor on or near a LaTeX formula when using these commands!
