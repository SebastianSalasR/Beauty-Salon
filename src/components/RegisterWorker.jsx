import React, { useState } from "react";
import { useForm } from "react-hook-form";

function RegisterWorker() {

	const { register, handleSubmit, formState: { errors } } = useForm(); // Used to capture the input 

	const onSubmit = handleSubmit(async (data) => {

		const res = await fetch("/api/workers", {
			method: "POST",
			headers: {
				"Content-Type": "application/json"
			},
			body: JSON.stringify({
				worker_name: data.worker_name,
				worker_last_name: data.worker_last_name,
				worker_phone_number: data.worker_phone_number,
				worker_salary: data.worker_salary,
			})
		});
		if (res.ok) {
			alert("Worker registered successfully");
			// Redirection or additional logic here if needed
		} else {
			alert("There's been a problem registering the worker");
		}

		console.log(res);
	});

	return (
		<section className="w-1/4">
			<form onSubmit={onSubmit}>
				<label>
					Register worker
				</label>

				<label htmlFor="worker_name" className="text-slate-500 mb-2 block text-sm">
					Name of the worker
				</label>
				<input type="text"
					{...register("worker_name", { required: { value: true, message: "Worker name is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="Name"
				/>
				{errors.worker_name && <p className="text-red-500 text-sm">{errors.worker_name.message}</p>}

				<label htmlFor="worker_last_name" className="text-slate-500 mb-2 block text-sm">
					Last name of the worker
				</label>
				<input type="text"
					{...register("worker_last_name", { required: { value: true, message: "Worker last name is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="Last name"
				/>
				{errors.worker_last_name && <p className="text-red-500 text-sm">{errors.worker_last_name.message}</p>}

				<label htmlFor="worker_phone_number" className="text-slate-500 mb-2 block text-sm">
					Phone number of the worker
				</label>
				<input type="tel"
					{...register("worker_phone_number", { required: { value: true, message: "Worker phone number is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="Phone number"
				/>
				{errors.worker_phone_number && <p className="text-red-500 text-sm">{errors.worker_phone_number.message}</p>}

				<label htmlFor="worker_salary" className="text-slate-500 mb-2 block text-sm">
					Salary of the worker
				</label>
				<input type="number"
					{...register("worker_salary", { required: { value: true, message: "Worker salary is required" } })}
					className="p-3 rounded block mb-2 bg-slate-900 text-slate-300 w-full"
					placeholder="Salary of the worker"
					min="0"
				/>
				{errors.worker_salary && <p className="text-red-500 text-sm">{errors.worker_salary.message}</p>}

				<button className="w-full bg-blue-500 text-white p-3 rounded-lg">
					Register worker
				</button>
			</form>
		</section>
	);
}

export default RegisterWorker;
