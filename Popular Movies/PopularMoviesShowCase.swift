

import Foundation


enum PopularMoviesShowCase {
    
    static let firstPage = PopularMoviesProps(
        movies: [
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg")!,
                name: "Batman",
                released: Date(),
                overview: "The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker, who has seized control of Gotham\'s underworld."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/udDVJXtAFsQ8DimrXkVFqy4DGEQ.jpg")!,
                name: "Batman",
                released: Date(),
                overview: "The Dynamic Duo faces four super-villains who plan to hold the world for ransom with the help of a secret invention that instantly dehydrates people."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/dr6x4GyyegBWtinPBzipY02J2lV.jpg")!,
                name: "Batman Begins",
                released: Date(),
                overview: "Driven by tragedy, billionaire Bruce Wayne dedicates his life to uncovering and defeating the corruption that plagues his home, Gotham City.  Unable to work within the system, he instead creates a new identity, a symbol of fear for the criminal underworld - The Batman."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/jX5THE1yW3zTdeD9dupcIyQvKiG.jpg")!,
                name: "Batman Returns",
                released: Date(),
                overview: "Having defeated the Joker, Batman now faces the Penguin - a warped and deformed individual who is intent on being accepted into Gotham society. Crooked businessman Max Schreck is coerced into helping him become Mayor of Gotham and they both attempt to expose Batman in a different light. Selina Kyle, Max\'s secretary, is thrown from the top of a building and is transformed into Catwoman - a mysterious figure who has the same personality disorder as Batman. Batman must attempt to clear his name, all the time deciding just what must be done with the Catwoman."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/79AYCcxw3kSKbhGpx1LiqaCAbwo.jpg")!,
                name: "Batman & Robin",
                released: Date(),
                overview: "Along with crime-fighting partner Robin and new recruit Batgirl, Batman battles the dual threat of frosty genius Mr. Freeze and homicidal horticulturalist Poison Ivy. Freeze plans to put Gotham City on ice, while Ivy tries to drive a wedge between the dynamic duo."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/eTMrHEhlFPHNxpqGwpGGTdAa0xV.jpg")!,
                name: "Batman Forever",
                released: Date(),
                overview: "The Dark Knight of Gotham City confronts a dastardly duo: Two-Face and the Riddler. Formerly District Attorney Harvey Dent, Two-Face believes Batman caused the courtroom accident which left him disfigured on one side. And Edward Nygma, computer-genius and former employee of millionaire Bruce Wayne, is out to get the philanthropist; as The Riddler. Former circus acrobat Dick Grayson, his family killed by Two-Face, becomes Wayne\'s ward and Batman\'s new partner Robin."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/1pHOqpdCYNmtRVJs6pGKQKttrPm.jpg")!,
                name: "The Lego Batman Movie",
                released: Date(),
                overview: "In the irreverent spirit of fun that made “The Lego Movie” a worldwide phenomenon, the self-described leading man of that ensemble—Lego Batman—stars in his own big-screen adventure. But there are big changes brewing in Gotham, and if he wants to save the city from The Joker’s hostile takeover, Batman may have to drop the lone vigilante thing, try to work with others and maybe, just maybe, learn to lighten up."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/7wnRn8iQ0QInEK1CaZFqw1zPhht.jpg")!,
                name: "Batman",
                released: Date(),
                overview: "Japanese master spy Daka operates a covert espionage-sabotage organization located in Gotham City\'s now-deserted Little Tokyo, which turns American scientists into pliable zombies."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/cGOPbv9wA5gEejkUN892JrveARt.jpg")!,
                name: "Batman v Superman: Dawn of Justice",
                released: Date(),
                overview: "Fearing the actions of a god-like Super Hero left unchecked, Gotham City’s own formidable, forceful vigilante takes on Metropolis’s most revered, modern-day savior, while the world wrestles with what sort of hero it really needs. And with Batman and Superman at war with one another, a new threat quickly arises, putting mankind in greater danger than it’s ever known before."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/5xSB0Npkc9Fd9kahKBsq9P4Cdzp.jpg")!,
                name: "Batman Ninja",
                released: Date(),
                overview: "Gorilla Grodd\'s time displacement machine transports many of Batman\'s worst enemies to feudal Japan, along with the Dark Knight and a few of his allies."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/uVdxoD9kn28qC8VQiVA6Uif1QHl.jpg")!,
                name: "Batman and Harley Quinn",
                released: Date(),
                overview: "Batman and Nightwing are forced to team with the Joker\'s sometimes-girlfriend Harley Quinn to stop a global threat brought about by Poison Ivy and Jason Woodrue, the Floronic Man."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/vPr6t2stb4NJ54151ms5xu8bykP.jpg")!,
                name: "The Batman vs. Dracula",
                released: Date(),
                overview: "Gotham City is terrorized not only by recent escapees Joker and Penguin, but by the original creature of the night, Dracula! Can Batman stop the ruthless vampire before he turns everyone in the city, including The Caped Crusader, Joker and Penguin, into his mindless minions?"
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/gmAZvUMQA7TgNd4uB9tRvgDnJJJ.jpg")!,
                name: "Batman: Hush",
                released: Date(),
                overview: "Animated  film based on the popular comic book written by Jeph Loeb"
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/7souLi5zqQCnpZVghaXv0Wowi0y.jpg")!,
                name: "Batman: Gotham by Gaslight",
                released: Date(),
                overview: "In an alternative Victorian Age Gotham City, Batman begins his war on crime while he investigates a new series of murders by Jack the Ripper."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/wDajiBlfMD4eCZKnC6asDCY0509.jpg")!,
                name: "Batman: Bad Blood",
                released: Date(),
                overview: "Bruce Wayne is missing. Alfred covers for him while Nightwing and Robin patrol Gotham City in his stead. And a new player, Batwoman, investigates Batman\'s disappearance."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/wNtrbql45NqvomsYKr3uHXgFj2D.jpg")!,
                name: "Superman/Batman: Apocalypse",
                released: Date(),
                overview: "Batman discovers a mysterious teen-aged girl with superhuman powers and a connection to Superman. When the girl comes to the attention of Darkseid, the evil overlord of Apokolips, events take a decidedly dangerous turn."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/bJBZxzFHfTAOtBg8fOCCaBmh4hF.jpg")!,
                name: "Superman/Batman: Public Enemies",
                released: Date(),
                overview: "United States President Lex Luthor uses the oncoming trajectory of a Kryptonite meteor to frame Superman and declare a $1 billion bounty on the heads of the Man of Steel and his ‘partner in crime’, Batman. Heroes and villains alike launch a relentless pursuit of Superman and Batman, who must unite—and recruit help—to try and stave off the action-packed onslaught, stop the meteor Luthors plot."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/bI1YVuhBN6Vws1GP9Mf01DyhC2s.jpg")!,
                name: "Batman: Year One",
                released: Date(),
                overview: "Two men come to Gotham City: Bruce Wayne after years abroad feeding his lifelong obsession for justice and Jim Gordon after being too honest a cop with the wrong people elsewhere. After learning painful lessons about the city\'s corruption on its streets and police department respectively, this pair learn how to fight back their own way. With that, Gotham\'s evildoers from top to bottom are terrorized by the mysterious Batman and the equally heroic Gordon is assigned to catch him by comrades who both hate and fear him themselves. In the ensuing manhunt, both find much in common as the seeds of an unexpected friendship are laid with additional friends and rivals helping to start the legend."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/j3SFJqZPeeB9g5JMU7UFLgEqj2T.jpg")!,
                name: "Son of Batman",
                released: Date(),
                overview: "Batman learns that he has a violent, unruly pre-teen son with Talia al Ghul named Damian Wayne who is secretly being raised by Ra\'s al Ghul and the League of Assassins. When Ra\'s al Ghul apparently dies after a battle with Deathstroke, Batman must work to stop his long-lost son from taking revenge and guiding him to a righteous path, in addition to the chance for the pair to truly acknowledging each other as family."
            ),
            PopularMoviesProps.Movie(
                poster: URL(string: "http://image.tmdb.org/t/p/w780/3t7QnmZSGk0c7K4b2mYKdCNj56y.jpg")!,
                name: "The Batman",
                released: Date(),
                overview: "Batman\'s first stand-alone appearance in the DC Extended Universe."
            )
        ],
        status: .loading,
        refresh: nil
    )
    
    static let firstPageEmpty = PopularMoviesProps(
        movies: [],
        status: .loaded(loadNextPage: nil),
        refresh: nil
    )
    
    static let firstPageError = PopularMoviesProps(
        movies: [],
        status: .failure(error: "[AXMediaCommon] Unexpected physical screen orientation"),
        refresh: nil
    )
}
