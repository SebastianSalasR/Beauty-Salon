import Image from "next/image";

const Product = ({ backgroundImage, title, subtitle, peopleJoined }) => {
    const styles = {
        backgroundImage: `url(${backgroundImage})`,
        backgroundSize: '50% auto',
        backgroundRepeat: 'no-repeat',
        backgroundPosition: 'center center'
    };

    return (
        <div className={`h-full w-full min-w-[1100px] ${backgroundImage}  bg-cover bg-no-repeat lg:rounded-r-5xl 2xl:rounded-5xl`}>
            <div className="flex h-full flex-col items-start justify-between p-6 lg:px-20 lg:py-10">
                <div className="flexCenter gap-4">
                    <div className="rounded-full bg-bonito-2 p-4">
                        <Image
                            src="/folded-map.svg"
                            alt="map"
                            width={28}
                            height={28}
                        />
                    </div>
                    <div className="flex flex-col gap-1">
                        <h4 className="bold-18 text-white">{title}</h4>
                        <p className="regular-14 text-white">{subtitle}</p>
                    </div>
                </div>

            </div>
        </div>
    )
}

async function Camp() {

    return (
        <section className="2xl:max-container relative flex flex-col py-10 lg:mb-10 lg:py-20 xl:mb-20">
            <div className="hide-scrollbar flex h-[340px] w-full items-start justify-start gap-8 overflow-x-auto lg:h-[400px] xl:h-[600px]">
                <Product
                    backgroundImage="bg-bg-img-rings"
                    title="Beauty blender"
                    subtitle="product"
                    peopleJoined="5 joined"
                />
            </div>

        </section>
    );
}
export default Camp;