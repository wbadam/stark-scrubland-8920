# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.new
user1.email='mail1@example.com'
user1.password='asdfghjk'
user1.password_confirmation='asdfghjk'
user1.save!
user2 = User.new
user2.email='mail2@example.com'
user2.password='asdfghjk'
user2.password_confirmation='asdfghjk'
user2.save!
admin = User.new
admin.email = 'admin@admin.com'
admin.password = 'adminadmin'
admin.password_confirmation = 'adminadmin'
admin.role = 'admin'
admin.save!

owner1 = Owner.create([{ name: 'John Doe', postal_address: '123 Auckland Street, Palmerston North', email: 'mail1@example.com', user: user1 }])

Dog.create([{ name: 'Ruby', breed: 'Vizsla', date_of_birth: Date.parse('10.10.2013'), owner: owner1.first, user: user1 }])

RegistrationPeriod.create([{ length: 3, cost: '$25' }, { length: 6, cost: '$65' }, { length: 12, cost: '$85' }])

BankAccount.create({account_number: '12-1234-1234-01'})

# AffenpinscherAfghan HoundAiredale TerrierAkitaAlaskan MalamuteAmerican English CoonhoundAmerican Eskimo DogAmerican FoxhoundAmerican Pit Bull TerrierAmerican Water SpanielAnatolian Shepherd DogAppenzeller SennenhundeAustralian Cattle DogAustralian ShepherdAustralian TerrierAzawakh
# BarbetBasenjiBasset HoundBeagleBearded CollieBedlington TerrierBelgian MalinoisBelgian SheepdogBelgian TervurenBerger PicardBernese Mountain DogBichon FriseBlack and Tan CoonhoundBlack Russian TerrierBloodhoundBluetick CoonhoundBologneseBorder CollieBorder TerrierBorzoiBoston TerrierBouvier des FlandresBoxerBoykin SpanielBracco ItalianoBriardBrittanyBrussels GriffonBull TerrierBulldogBullmastiff
# Cairn TerrierCanaan DogCane CorsoCardigan Welsh CorgiCatahoula Leopard DogCavalier King Charles SpanielCesky TerrierChesapeake Bay RetrieverChihuahuaChinese CrestedChinese Shar-PeiChinookChow ChowClumber SpanielCockapooCocker SpanielCollieCoton de TulearCurly-Coated Retriever
# DachshundDalmatianDandie Dinmont TerrierDoberman PinscherDogue de Bordeaux
# English Cocker SpanielEnglish FoxhoundEnglish SetterEnglish Springer SpanielEnglish Toy SpanielEntlebucher Mountain Dog
# Field SpanielFinnish LapphundFinnish SpitzFlat-Coated RetrieverFox TerrierFrench Bulldog
# German PinscherGerman Shepherd DogGerman Shorthaired PointerGerman Wirehaired PointerGiant SchnauzerGlen of Imaal TerrierGoldadorGolden RetrieverGoldendoodleGordon SetterGreat DaneGreat PyreneesGreater Swiss Mountain DogGreyhound
# HarrierHavanese
# Ibizan HoundIcelandic SheepdogIrish Red and White SetterIrish SetterIrish TerrierIrish Water SpanielIrish WolfhoundItalian Greyhound
# Jack Russell TerrierJapanese Chin
# Korean Jindo DogKeeshondKerry Blue TerrierKomondorKooikerhondjeKuvasz
# LabradoodleLabrador RetrieverLakeland TerrierLancashire HeelerLeonbergerLhasa ApsoLowchen
# MalteseMaltese Shih TzuMaltipooManchester TerrierMastiffMiniature PinscherMiniature SchnauzerMutt
# Neapolitan MastiffNewfoundlandNorfolk TerrierNorwegian BuhundNorwegian ElkhoundNorwegian LundehundNorwich TerrierNova Scotia Duck Tolling Retriever
# Old English SheepdogOtterhound
# PapillonPeekapooPekingesePembroke Welsh CorgiPetit Basset Griffon VendeenPharaoh HoundPlottPocket BeaglePointerPolish Lowland SheepdogPomeranianPoodlePortuguese Water DogPugPugglePuliPyrenean Shepherd
#
# Rat TerrierRedbone CoonhoundRhodesian RidgebackRottweiler
# Saint BernardSalukiSamoyedSchipperkeSchnoodleScottish DeerhoundScottish TerrierSealyham TerrierShetland SheepdogShiba InuShih TzuSiberian HuskySilky TerrierSkye TerrierSloughiSmall Munsterlander PointerSoft Coated Wheaten TerrierStabyhounStaffordshire Bull TerrierStandard SchnauzerSussex SpanielSwedish Vallhund
# Tibetan MastiffTibetan SpanielTibetan TerrierToy Fox TerrierTreeing Tennessee BrindleTreeing Walker Coonhound
# Vizsla
# WeimaranerWelsh Springer SpanielWelsh TerrierWest Highland White TerrierWhippetWirehaired Pointing Griffon
# Xoloitzcuintli
# YorkipooYorkshire Terrier