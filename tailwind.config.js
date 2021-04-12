const defaultTheme = require("tailwindcss/defaultTheme");
const colors = require("tailwindcss/colors");

module.exports = {
  purge: ["./app/views/**/*.html.erb"],
  darkMode: false,
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter", ...defaultTheme.fontFamily.sans],
      },
      colors: {
        rose: colors.rose,
      },
    },
  },
  variants: {
    extend: {
      boxShadow: ["focus-within"],
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
