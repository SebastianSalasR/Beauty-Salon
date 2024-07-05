import React, { useState } from "react";
import { useForm } from "react-hook-form";

function Registerservice() {

	const { register, handleSubmit, formState: { errors } } = useForm(); // Used to capture the input 

	const onSubmit = handleSubmit(async (data) => {

		const res = await fetch("/api/service", {
			method: "POST",
			headers: {
				"Content-Type": "application/json"
			},
			body: JSON.stringify({
				service_price: data.service_price,
				service_kind: data.service_kind,
			})
		});
		if (res.ok) {
			alert("service registered successfully");
		} else {
			alert("There's been a problem registering the service");
		}

		console.log(res);
	});

	return (
		<section className="w-1/4">
			<form onSubmit={onSubmit}>
				<label>
					Register service
				</label>

				<label htmlFor="service_kind" className="text-slate-500 mb-2 block text-sm">
					Kind of the service
				</label>
				<input type="text"
					{...register("service_kind", { required: { value: true, message: "service last name is required" } })}
					className="p-3 rounded block mb-2 bg-azure text-slate-300 w-full"
					placeholder="Service"
				/>
				{errors.service_kind && <p className="text-red-500 text-sm">{errors.service_kind.message}</p>}


				<label htmlFor="service_price" className="text-slate-500 mb-2 block text-sm">
					Price of the service
				</label>
				<input type="number"
					{...register("service_price", { required: { value: true, message: "service name is required" } })}
					className="p-3 rounded block mb-2 bg-azure text-slate-300 w-full"
					placeholder="Price"
				/>
				{errors.service_price && <p className="text-red-500 text-sm">{errors.service_price.message}</p>}


				<button className="w-full bg-crimson text-white p-3 rounded-lg">
					Register service
				</button>
			</form>
		</section>
	);
}

export default Registerservice;
