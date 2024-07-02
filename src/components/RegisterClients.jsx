import React, { useState } from "react";
import { useForm } from "react-hook-form";

function Registerclient() {

	const { register, handleSubmit, formState: { errors } } = useForm(); // Used to capture the input 

	const onSubmit = handleSubmit(async (data) => {

		const res = await fetch("/api/clients", {
			method: "POST",
			headers: {
				"Content-Type": "application/json"
			},
			body: JSON.stringify({
				client_name: data.client_name,
				client_last_name: data.client_last_name,
				client_phone_number: data.client_phone_number,
				client_salary: data.client_salary,
			})
		});
		if (res.ok) {
			alert("client registered successfully");
			// Redirection or additional logic here if needed
		} else {
			alert("There's been a problem registering the client");
		}

		console.log(res);
	});

	return (
		<section className="w-1/4">
			<form onSubmit={onSubmit}>
				<label>
					Register client
				</label>


				<label htmlFor="client_name" className="text-slate-500 mb-2 block text-sm">
					Name of the client
				</label>
				<input type="text"
					{...register("client_name", { required: { value: true, message: "Client Name is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="Name"
				/>
				{errors.client_name && <p className="text-red-500 text-sm">{errors.client_name.message}</p>}


				<label htmlFor="client_last_name" className="text-slate-500 mb-2 block text-sm">
					Last name of the client 
				</label>
				<input type="text"
					{...register("client_last_name", { required: { value: true, message: "Client last name is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="Last name"
				/>
				{errors.client_last_name && <p className="text-red-500 text-sm">{errors.client_last_name.message}</p>}


				<label htmlFor="client_phone_number" className="text-slate-500 mb-2 block text-sm">
					Phone number of the client
				</label>
				<input type="number"
					{...register("client_phone_number", { required: { value: true, message: "client phone number is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="Phone number"
				/>
				{errors.client_phone_number && <p className="text-red-500 text-sm">{errors.client_phone_number.message}</p>}


				<button className="w-full bg-blue-500 text-white p-3 rounded-lg">
					Register client
				</button>
			</form>
		</section>
	);
}

export default Registerclient;
