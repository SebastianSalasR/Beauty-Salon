const {nextui} = require('@nextui-org/theme');
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
    "./node_modules/@nextui-org/theme/dist/components/[object Object].js"
  ],
	prefix: '',
	important: false,
	separator: ':',
	theme: {
		extend: {
			colors: {
				cornsilk: "#FFF8DC",
				azure: "#FFFAFA",
				crimson: "#C93B61",
				bonito: {
					1: '#EEE2DC',
					2: '#EDC7B7',
					3: "#123C69",
					4: "#AC3B61",
				},
				green: {
					50: '#30AF5B',
					90: '#292C27',
				},
				gray: {
					10: '#EEEEEE',
					20: '#A2A2A2',
					30: '#7B7B7B',
					50: '#585858',
					90: '#141414',
				},
				orange: {
					50: '#FF814C',
				},
				blue: {
					70: '#021639',
				},
				yellow: {
					50: '#FEC601',
				},
			},
			backgroundImage: {
				'bg-img-1': "url('/img-1.png')",
				'bg-img-2': "url('/rings.jpg')",
				'bg-img-rings': "url('/rings.jpg')",
				'feature-bg': "url('/feature-bg.png')",
				pattern: "url('/pattern.png')",
				'pattern-2': "url('/pattern-bg.png')",
			},
			screens: {
				xs: '400px',
				'3xl': '1680px',
				'4xl': '2200px',
			},
			maxWidth: {
				'10xl': '1512px',
			},
			borderRadius: {
				'5xl': '40px',
			},
		},
		fontSize: {
			'52': '3.25rem',  // Puedes ajustar este valor
			'88': '5.5rem',   // Puedes ajustar este valor
		},
	},
	variants: {},
  plugins: [nextui()],
}