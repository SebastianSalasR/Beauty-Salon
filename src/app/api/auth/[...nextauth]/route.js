import NextAuth from "next-auth"
import CredentialsProvider from "next-auth/providers/credentials"
import prisma from "@/libs/prisma/"
import bcrypt from "bcrypt"

export const authOptions = {
    providers: [
        CredentialsProvider({
            name: "Credentials",
            credentials: {
                email: { label: "Email", type: "email", placeholder: "Enter your email" },
                password: { label: "Password", type: "password", placeholder: "Enter your password" }
            },
            async authorize(credentials, req) {
                console.log(credentials)

                const userFound = await prisma.user.findUnique({
                    where: {
                        email: credentials.email
                    }
                })


                if (!userFound) throw new Error("User not found")
                console.log(userFound)

                const matchPassword = await bcrypt.compare(credentials.password, userFound.password)

                if (!matchPassword) throw new Error("Wrong password");

                return {
                    id: userFound.id,
                    name: userFound.username,
                    email: userFound.email,

                }//Este objeto recibe los datos(3 por default) para crear un token

            }
        })
    ],
    pages: {
        signIn: "/auth/login",
    }
};

const handler = NextAuth(authOptions)

export { handler as GET, handler as POST }