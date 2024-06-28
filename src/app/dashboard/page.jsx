"use client";
import { signOut } from "next-auth/react";
import React, { useState } from "react";
import { TimeInput } from "@nextui-org/date-input";
import { Time } from "@internationalized/date";

function DashboardPage() {
  const [startDate, setStartDate] = useState(new Date());
  const [eventTime, setEventTime] = useState(new Time());

  const handleSubmit = (e) => {
    e.preventDefault();
    const date = startDate.toISOString().split("T")[0];
    const time = eventTime.toString();
    const dateTimeString = `${date} ${time}`;
    console.log(dateTimeString);
  };

  return (
    <main className="h-[calc(100vh-7rem)] flex justify-center items-center">
      <section className="max-container bg-bonito-1 padding-container flex flex-col gap-20 py-10">
        <form className="flex flex-wrap gap-4" onSubmit={handleSubmit}>
          <label>
            Choose a date:
            <input
              type="date"
              value={startDate.toISOString().split("T")[0]}
              onChange={(e) => setStartDate(new Date(e.target.value))}
            />
          </label>
          <div className="max-w-xl flex flex-col items-end gap-4">
            <TimeInput
              label="Event Time"
              labelPlacement="outside-left"
              value={eventTime}
              onChange={setEventTime}
            />
          </div>
          <button type="submit">Submit</button>
        </form>
        <form>
          <h1>Buy products</h1>
        </form>
      </section>
    </main>
  );
}

export default DashboardPage;
