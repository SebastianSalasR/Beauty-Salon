import Image from "next/image"
import Button from "./Button"
import Link from 'next/link'

async function Hero() {
    return (
        <section className="max-container bg-bonito-1 padding-container felx flex-col gap-20 py-10 ">
            <div className="hero-map" />

            {/*Left*/}

            <div className="relative z-20 flex flex-1 flex-col">
                {

                    /*
                    <Image
                        src="/sponge.png"
                        alt="camp"
                        width={50}
                        height={50}
                        className="absolute left-[-5px] top-[-30px] w-10 lg:w-[50px]"
                    />
                    */
                }
                <h1 className="bold-52 lg:bold-88 "> Beauty salon </h1>
                <p className="regular-16 mt-6 text-gray-30 xl:max-w-[520px]">
                    At Beauty Salonl, we pride ourselves on being the preferred choice for all your beauty needs. With locations throughout Chile, we offer a comprehensive experience that combines the best in beauty services and a wide range of products for you to continue your personal care at home. Our commitment is to provide you with a relaxing and professional environment where you can enjoy the best treatments and find high quality products.

                    Translated with DeepL.com (free version)
                </p>

                <div className="my-11 flex flex-wrap gap-5">
                    <div className="flex items-center gap-2">
                        {Array(5).fill(1).map((_, i) => (
                            <Image
                                src="/star.svg"
                                key={i}
                                alt="star"
                                width={20}
                                height={20}
                            />
                        ))}
                    </div>
                    <p className="bold-16 lg:bold-20 text-blue-70">
                        198k
                        <span className="regular-16 lg:regular-20 ml-1 "> Excelent reviews</span>
                    </p>
                </div>
                <div className="flex flex-col w-full gap-3 sm:flex-row">
                    <Link href="/dashboard">
                    <Button
                        type="button"
                        title="Go to dashboard"
                        variant="btn_burgundy"
                        onClick={() => router.push('/dashboard')}
                    />
                    </Link>

                    <Button
                        type="button"
                        title="How we work?"
                        icon="/play.svg"
                        variant="btn_burgundy_white"

                    />
                </div>
            </div>
        </section>
    )
}
export default Hero;