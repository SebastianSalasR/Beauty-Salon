import prisma from "@/libs/prisma";
import bcrypt from "bcrypt";
const { NextResponse } = require("next/server");

async function validateUniqueField(data, field, errorMessage, status) {
	const existingUser = await prisma.user.findUnique({
		where: { [field]: data[field] },
	});

	if (existingUser) {
		return { message: errorMessage, status };
	}
}

export async function POST(request) {
	try {
		const data = await request.json();

		const emailValidationError = await validateUniqueField(data, "email", "Email already exists", 400);
		if (emailValidationError) {
			return NextResponse.json(emailValidationError);
		}

		const usernameValidationError = await validateUniqueField(data, "username", "Username already exists", 400);
		if (usernameValidationError) {
			return NextResponse.json(usernameValidationError);
		}

		console.log(data); // Now data is logged only if both validations pass

		const hashedPassword = await bcrypt.hash(data.password, 10)

		const newUser = await prisma.user.create({
			data: {
				username: data.username,
				email: data.email,
				password: hashedPassword,
			}
		});

		return NextResponse.json(newUser);
	}
	
	catch (error) {
		return NextResponse.json({ message: error.message, status: 500 });
	}
}
