import prisma from "@/libs/prisma";
import { NextResponse } from "next/server";

async function validateUniqueField(data, field, errorMessage, status) {
	const existingUser = await prisma.trabajador.findUnique({
		where: { [field]: data[field] },
	});

	if (existingUser) {
		return ({ message: errorMessage, status});
	}
}

export async function POST(req) {
	try {
		const data = await req.json();
		console.log("data:")
		console.log(data);
		/*
		const phoneValidationError = await validateUniqueField(data, "telefono", "Phone number already exists");
		if (phoneValidationError) {
			return phoneValidationError;
		}
		*/
		
		console.log("Creating new worker... ");
		const newWorker = await prisma.trabajador.create({
			data: {
				nombre: data.worker_name,
				apellido: data.worker_last_name,
				telefono: data.worker_phone_number,
				id_sede: 1,
				id_comuna: 1,
			}
		});
		
		console.log("New worker created: ")
		console.log(newWorker);
		
		return NextResponse.json(newWorker);
	} catch (error) {
		return NextResponse.json({ message: error.message, status: 500 });
	}
};
