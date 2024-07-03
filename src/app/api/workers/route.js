import prisma from "@/libs/prisma";
import { NextResponse } from "next/server";
import pool from "@/utils/Pool";

export async function POST(req) {
	try {
		const data = await req.json();
		console.log("data:")
		console.log(data);

		const 
		
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
