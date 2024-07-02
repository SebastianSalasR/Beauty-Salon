import prisma from "@/libs/prisma";
import { NextResponse } from "next/server";

async function validateUniqueField(data, field, errorMessage) {
	const existingUser = await prisma.Trabajador.findUnique({
		where: { [field]: data[field] },
	});

	if (existingUser) {
		return NextResponse.json({ message: errorMessage, status: 400 });
	}
}

export async function POST(req) {
	try {
		const data = await req.json();

		console.log(data);
		
		const phoneValidationError = await validateUniqueField(data, "telefono", "Phone number already exists");
		if (phoneValidationError) {
			return phoneValidationError;
		}

		const newWorker = await prisma.Trabajador.create({
			data: {
				id_trabajador: 1,
				nombre: data.worker_name,
				apellido: data.worker_last_name,
				telefono: data.worker_phone_number,
				id_comuna: 1,
				id_sede: 1,
			}
		});

		console.log(newWorker);
		
		return NextResponse.json(newWorker);
	} catch (error) {
		return NextResponse.json({ message: error.message, status: 500 });
	}
};
