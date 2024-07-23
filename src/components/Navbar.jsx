import Link from "next/link"
import Image from "next/image";
import { getServerSession } from "next-auth/next";
import { authOptions } from "@/app/api/auth/[...nextauth]/route";

async function Navbar() {

	const session = await getServerSession(authOptions)
	console.log(session);

	return (
		<nav className="flex bg-bonito-2 justify-between text-grey px-24 py-5">
			<Link href="/">
				<Image src="/tech.svg" alt = "logo" width={48} height={27}/>
			</Link>
			<ul className="text-black flex gap-x-5 py-3 ">
				{!session?.user ? (
					<>
						<li>
							<Link href="/">
								Home
							</Link>
						</li>
						<li>
							<Link href="/auth/login">
								Login
							</Link>
						</li>
						<li>
							<Link href="/auth/register">
								Register
							</Link>
						</li>

					</>
				) : (
					<>
						<li>
							<Link href="/dashboard">
								Dashboard
							</Link>
						</li>
						<li>
							<Link href="/api/auth/signout">
								Logout
							</Link>
						</li>
					</>
				)}
			</ul>
		</nav>
	);
}

export default Navbar;