"use client";
import { signOut } from "next-auth/react";
import React, { useState } from "react";
import { useForm } from "react-hook-form"
import { useRouter } from "next/navigation";
import RegisterWorker from "@/components/RegisterWorker"
import Registerclient from "@/components/RegisterClients";

function DashboardPage() {

	return (
		<main className="h-[calc(100vh-7rem)] flex flex-col space-y-10 justify-center items-center bg-bonito-1">

				<Registerclient />
				<RegisterWorker />

		</main>
	);
}

export default DashboardPage;
