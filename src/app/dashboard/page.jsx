"use client";
import React, { useState } from "react";
import RegisterWorker from "@/components/RegisterWorker"
import Registerclient from "@/components/RegisterClients";
import RegisterService from "@/components/RegisterService";
import RegisterDates from "@/components/RegisterDate";

function DashboardPage() {

	return(
		<main className="h-[calc(100vh-7rem)] flex flex-col space-y-10 justify-center items-center bg-bonito-1">

			<div className="flex flex-row space-x-10">
				<Registerclient />
				<RegisterWorker />
				<RegisterService />
				<RegisterDates />
			</div>

		</main>
	);
}

export default DashboardPage;
