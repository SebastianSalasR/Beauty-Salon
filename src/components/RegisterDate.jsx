import React, { useState } from "react";
import { useForm } from "react-hook-form";

function RegisterDate() {

	const { register, handleSubmit, formState: { errors } } = useForm(); // Used to capture the input 

	const onSubmit = handleSubmit(async (data) => {

		const res = await fetch("/api/date", {
			method: "POST",
			headers: {
				"Content-Type": "application/json"
			},
			body: JSON.stringify({
				client_date: data.client_date,
				date_date: data.date_date,
				worker_date: data.workexr_date,
				service_date: data.service_date
			})
		});
		if (res.ok) {
			alert("Date registered successfully");
		} else {
			alert("There's been a problem registering the date");
		}

		console.log(res);
	});

	return (
		<section className="w-1/4">
			<form onSubmit={onSubmit}>
				<label>
					Register Date
				</label>

				<label htmlFor="client_date" className="text-slate-500 mb-2 block text-sm">
					Client Name
				</label>
				<input type="text"
					{...register("client_date", { required: { value: true, message: "Name Client is required" } })}
					className="p-3 rounded block mb-2 bg-azure text-slate-300 w-full"
					placeholder="Client Name"
				/>
				{errors.client_date && <p className="text-red-500 text-sm">{errors.client_date.message}</p>}

				<label htmlFor="date_date" className="text-slate-500 mb-2 block text-sm">
					Date
				</label>
				<input type="date"
					{...register("date_date", { required: { value: true, message: "Date is required" } })}
					className="p-3 rounded block mb-2 bg-azure text-slate-300 w-full"
					placeholder="date_date"
				/>
				{errors.date_date && <p className="text-red-500 text-sm">{errors.date_date.message}</p>}

				<label htmlFor="worker_date" className="text-slate-500 mb-2 block text-sm">
					Worker
				</label>
				<input type="worker_date"
					{...register("worker_date", { required: { value: true, message: "Worker is required" } })}
					className="p-3 rounded block mb-2 bg-azure text-slate-300 w-full"
					placeholder="Worker"
				/>
				{errors.worker_date && <p className="text-red-500 text-sm">{errors.worker_date.message}</p>}

				<label htmlFor="service_date" className="text-slate-500 mb-2 block text-sm">
					Service
				</label>
				<input type="service_date"
					{...register("service_date", { required: { value: true, message: "Service is required" } })}
					className="p-3 rounded block mb-2 bg-azure text-slate-300 w-full"
					placeholder="Service"
					min="0"
				/>
				{errors.service_date && <p className="text-red-500 text-sm">{errors.service_date.message}</p>}

				<button className="w-full bg-crimson text-white p-3 rounded-lg">
					Register Date
				</button>
			</form>
		</section>
	);
}

export default RegisterDate;
