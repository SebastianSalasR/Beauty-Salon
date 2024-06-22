"use client"
import { useForm } from "react-hook-form"
import { useRouter } from "next/navigation";

function registerPage() {

	const { register, handleSubmit, formState: { errors } } = useForm();// Used to capture the input 
	const router = useRouter()

	const onSubmit = handleSubmit(async (data) => {
		if (data.password !== data.confirmPassword)
			return alert("Password doesn't match");

		const res = await fetch("/api/auth/register", {
			method: "POST",
			headers: {
				"Content-Type": "application/json"
			},
			body: JSON.stringify({
				username: data.username,
				email: data.email,
				password: data.password,
			})
		})
		if (res.ok) {
			router.push("/auth/login")
		}

		console.log(res)
	});

	console.log(errors)

	return (
		<div className="h-[calc(100vh-7rem)] flex justify-center items-center">

			<form onSubmit={onSubmit} className="w-1/4">
				<h1 className="text-slate-200 font-bold text-4xl mb-4">
					Register
				</h1>

				<label htmlFor="username" className="text-slate-500 mb-2 block text-sm">
					username
				</label>
				<input type="text"
					// Calls the method register | set the variable name | then some object with their propierties, i.e this field is requiered
					{...register("username", { required: { value: true, message: "User is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="Username"
				/>
				{
					errors.username && (<span className="text-red-500">{errors.username.message}</span>)
				}


				<label htmlFor="email" className="text-slate-500 mb-2 block text-sm">
					Email:
				</label>
				<input type="email"
					{...register("email", { required: { value: true, message: "Email is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="email@email.com"
				/>
				{
					errors.email && (<span className="text-red-500">{errors.email.message}</span>)
				}


				<label htmlFor="password" className="text-slate-500 mb-2 block text-sm">
					password
				</label>
				<input type="password"
					{...register("password", { required: { value: true, message: "Password is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="****"
				/>
				{
					errors.password && (<span className="text-red-500">{errors.password.message}</span>)
				}


				<label htmlFor="confirmPassword" className="text-slate-500 mb-2 block text-sm">
					Confirm password
				</label>
				<input type="confirmPassword"
					{...register("confirmPassword", { required: { value: true, message: "Password confirmation is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="****"
				/>
				{
					errors.confirmPassword && (<span className="text-red-500">{errors.confirmPassword.message}</span>)
				}

				<button className="w-full bg-blue-500 text-white p-3 rounded-lg">
					Register
				</button>
			</form>
		</div>
	)

}
export default registerPage