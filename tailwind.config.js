module.exports = {
  mode: "jit"
  purge: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
  ],
  darkMode: false
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/forms"),
  ],
}
