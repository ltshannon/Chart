//
//  VirusTrackingViewModel.swift
//  Chart
//
//  Created by Larry Shannon on 4/15/20.
//  Copyright © 2020 Larry Shannon. All rights reserved.
//

import Foundation

let pomberCountries = [
    "Andorra",
    "United Arab Emirates",
    "Afghanistan",
    "Antigua and Barbuda",
    "Anguilla",
    "Albania",
    "Armenia",
    "Angola",
    "Antarctica",
    "Argentina",
    "American Samoa",
    "Austria",
    "Australia",
    "Aruba",
    "Åland Islands",
    "Azerbaijan",
    "Bosnia and Herzegovina",
    "Barbados",
    "Bangladesh",
    "Belgium",
    "Burkina Faso",
    "Bulgaria",
    "Bahrain",
    "Burundi",
    "Benin",
    "Saint Barthélemy",
    "Bermuda",
    "Brunei",
    "Bolivia",
    "Bonaire, Sint Eustatius and Saba",
    "Brazil",
    "Bahamas",
    "Bhutan",
    "Bouvet Island",
    "Botswana",
    "Belarus",
    "Belize",
    "Canada",
    "Cocos (Keeling) Islands",
    "Congo (Kinshasa)",
    "Central African Republic",
    "Congo",
    "Switzerland",
    "Cote d'Ivoire",
    "Cook Islands",
    "Chile",
    "Cameroon",
    "China",
    "Colombia",
    "Costa Rica",
    "Cuba",
    "Cape Verde",
    "Curaçao",
    "Christmas Island",
    "Cyprus",
    "Czechia",
    "Germany",
    "Djibouti",
    "Denmark",
    "Dominica",
    "Dominican Republic",
    "Cruise Ship",
    "Algeria",
    "Ecuador",
    "Estonia",
    "Egypt",
    "Western Sahara",
    "Eritrea",
    "Spain",
    "Ethiopia",
    "European Union",
    "Finland",
    "Fiji",
    "Falkland Islands (Malvinas)",
    "Micronesia",
    "Faroe Islands",
    "France",
    "Gabon",
    "United Kingdom",
    "Grenada",
    "Georgia",
    "French Guiana",
    "Guernsey",
    "Ghana",
    "Gibraltar",
    "Greenland",
    "Gambia",
    "Guinea",
    "Guadeloupe",
    "Equatorial Guinea",
    "Greece",
    "South Georgia",
    "Guatemala",
    "Guam",
    "Guinea-Bissau",
    "Guyana",
    "Hong Kong",
    "Heard Island and Mcdonald Islands",
    "Honduras",
    "Croatia",
    "Haiti",
    "Hungary",
    "Indonesia",
    "Ireland",
    "Israel",
    "Isle of Man",
    "India",
    "British Indian Ocean Territory",
    "Iraq",
    "Iran",
    "Iceland",
    "Italy",
    "Jersey",
    "Jamaica",
    "Jordan",
    "Japan",
    "Kenya",
    "Kyrgyzstan",
    "Cambodia",
    "Kiribati",
    "Comoros",
    "Saint Kitts and Nevis",
    "North Korea",
    "Korea, South",
    "Kuwait",
    "Cayman Islands",
    "Kazakhstan",
    "Lao People's Democratic Republic",
    "Lebanon",
    "Saint Lucia",
    "Liechtenstein",
    "Sri Lanka",
    "Liberia",
    "Lesotho",
    "Lithuania",
    "Luxembourg",
    "Latvia",
    "Libya",
    "Morocco",
    "Monaco",
    "Moldova",
    "Montenegro",
    "Saint Martin (French Part)",
    "Madagascar",
    "Marshall Islands",
    "North Macedonia",
    "Mali",
    "Myanma",
    "Mongolia",
    "Macao",
    "Northern Mariana Islands",
    "Martinique",
    "Mauritania",
    "Montserrat",
    "Malta",
    "Mauritius",
    "Maldives",
    "Malawi",
    "Mexico",
    "Malaysia",
    "Mozambique",
    "Namibia",
    "New Caledonia",
    "Niger",
    "Norfolk Island",
    "Nigeria",
    "Nicaragua",
    "Netherlands",
    "Norway",
    "Nepal",
    "Nauru",
    "Niue",
    "New Zealand",
    "Oman",
    "Panama",
    "Peru",
    "French Polynesia",
    "Papua New Guinea",
    "Philippines",
    "Pakistan",
    "Poland",
    "Saint Pierre and Miquelon",
    "Pitcairn",
    "Puerto Rico",
    "Palestinian Territory",
    "Portugal",
    "Palau",
    "Paraguay",
    "Qatar",
    "Réunion",
    "Romania",
    "Serbia",
    "Russia",
    "Rwanda",
    "Saudi Arabia",
    "Solomon Islands",
    "Seychelles",
    "Sudan",
    "Sweden",
    "Singapore",
    "Saint Helena, Ascension and Tristan Da Cunha",
    "Slovenia",
    "Svalbard and Jan Mayen",
    "Slovakia",
    "Sierra Leone",
    "San Marino",
    "Senegal",
    "Somalia",
    "Suriname",
    "South Sudan",
    "Sao Tome and Principe",
    "El Salvador",
    "Sint Maarten (Dutch Part)",
    "Syrian Arab Republic",
    "Swaziland",
    "Turks and Caicos Islands",
    "Chad",
    "French Southern Territories",
    "Togo",
    "Thailand",
    "Tajikistan",
    "Tokelau",
    "Timor-Leste",
    "Turkmenistan",
    "Tunisia",
    "Tonga",
    "Turkey",
    "Trinidad and Tobago",
    "Tuvalu",
    "Taiwan*",
    "Tanzania",
    "Ukraine",
    "Uganda",
    "United States Minor Outlying Islands",
    "US",
    "Uruguay",
    "Uzbekistan",
    "Holy See",
    "Saint Vincent and The Grenadines",
    "Venezuela",
    "Virgin Islands, British",
    "Virgin Islands, U.S.",
    "Vietnam",
    "Vanuatu",
    "Wallis and Futuna",
    "Samoa",
    "Kosovo",
    "Yemen",
    "Mayotte",
    "South Africa",
    "Zambia",
    "Zimbabwe"
]

struct CovidCountries: Decodable {
    let US: [CovidData]?
    let Thailand: [CovidData]?
    let Andorra: [CovidData]?
    let Afghanistan: [CovidData]?
    let AntiguaandBarbuda: [CovidData]?
    let Anguilla: [CovidData]?
    let Albania: [CovidData]?
    let Armenia: [CovidData]?
    let Angola: [CovidData]?
    let Antarctica: [CovidData]?
    let Argentina: [CovidData]?
    let AmericanSamoa: [CovidData]?
    let Austria: [CovidData]?
    let Australia: [CovidData]?
    let Aruba: [CovidData]?
    let AlandIslands: [CovidData]?
    let Azerbaijan: [CovidData]?
    let BosniaandHerzegovina: [CovidData]?
    let Barbados: [CovidData]?
    let Bangladesh: [CovidData]?
    let Belgium: [CovidData]?
    let BurkinaFaso: [CovidData]?
    let Bulgaria: [CovidData]?
    let Bahrain: [CovidData]?
    let Burundi: [CovidData]?
    let Benin: [CovidData]?
    let SaintBarthelemy: [CovidData]?
    let Bermuda: [CovidData]?
    let Brunei: [CovidData]?
    let Bolivia: [CovidData]?
    let BonaireSintEustatiusandSaba: [CovidData]?
    let Brazil: [CovidData]?
    let Bahamas: [CovidData]?
    let Bhutan: [CovidData]?
    let BouvetIsland: [CovidData]?
    let Botswana: [CovidData]?
    let Belarus: [CovidData]?
    let Belize: [CovidData]?
    let Canada: [CovidData]?
    let CocosKeelingIslands: [CovidData]?
    let CongoKinshasa: [CovidData]?
    let CentralAfricanRepublic: [CovidData]?
    let Congo: [CovidData]?
    let Switzerland: [CovidData]?
    let CotedIvoire: [CovidData]?
    let CookIslands: [CovidData]?
    let Chile: [CovidData]?
    let Cameroon: [CovidData]?
    let China: [CovidData]?
    let Colombia: [CovidData]?
    let CostaRica: [CovidData]?
    let Cuba: [CovidData]?
    let CapeVerde: [CovidData]?
    let Curaçao: [CovidData]?
    let ChristmasIsland: [CovidData]?
    let Cyprus: [CovidData]?
    let Czechia: [CovidData]?
    let Germany: [CovidData]?
    let Djibouti: [CovidData]?
    let Denmark: [CovidData]?
    let Dominica: [CovidData]?
    let DominicanRepublic: [CovidData]?
    let CruiseShip: [CovidData]?
    let Algeria: [CovidData]?
    let Ecuador: [CovidData]?
    let Estonia: [CovidData]?
    let Egypt: [CovidData]?
    let WesternSahara: [CovidData]?
    let Eritrea: [CovidData]?
    let Spain: [CovidData]?
    let Ethiopia: [CovidData]?
    let EuropeanUnion: [CovidData]?
    let Finland: [CovidData]?
    let Fiji: [CovidData]?
    let FalklandIslandsMalvinas: [CovidData]?
    let Micronesia: [CovidData]?
    let FaroeIslands: [CovidData]?
    let France: [CovidData]?
    let Gabon: [CovidData]?
    let UnitedKingdom: [CovidData]?
    let Grenada: [CovidData]?
    let Georgia: [CovidData]?
    let FrenchGuiana: [CovidData]?
    let Guernsey: [CovidData]?
    let Ghana: [CovidData]?
    let Gibraltar: [CovidData]?
    let Greenland: [CovidData]?
    let Gambia: [CovidData]?
    let Guinea: [CovidData]?
    let Guadeloupe: [CovidData]?
    let EquatorialGuinea: [CovidData]?
    let Greece: [CovidData]?
    let SouthGeorgia: [CovidData]?
    let Guatemala: [CovidData]?
    let Guam: [CovidData]?
    let GuineaBissau: [CovidData]?
    let Guyana: [CovidData]?
    let HongKong: [CovidData]?
    let HeardIslandandMcdonaldIslands: [CovidData]?
    let Honduras: [CovidData]?
    let Croatia: [CovidData]?
    let Haiti: [CovidData]?
    let Hungary: [CovidData]?
    let Indonesia: [CovidData]?
    let Ireland: [CovidData]?
    let Israel: [CovidData]?
    let IsleofMan: [CovidData]?
    let India: [CovidData]?
    let BritishIndianOceanTerritory: [CovidData]?
    let Iraq: [CovidData]?
    let Iran: [CovidData]?
    let Iceland: [CovidData]?
    let Italy: [CovidData]?
    let Jersey: [CovidData]?
    let Jamaica: [CovidData]?
    let Jordan: [CovidData]?
    let Japan: [CovidData]?
    let Kenya: [CovidData]?
    let Kyrgyzstan: [CovidData]?
    let Cambodia: [CovidData]?
    let Kiribati: [CovidData]?
    let Comoros: [CovidData]?
    let SaintKittsandNevis: [CovidData]?
    let NorthKorea: [CovidData]?
    let KoreaSouth: [CovidData]?
    let Kuwait: [CovidData]?
    let CaymanIslands: [CovidData]?
    let Kazakhstan: [CovidData]?
    let LaoPeoplesDemocraticRepublic: [CovidData]?
    let Lebanon: [CovidData]?
    let SaintLucia: [CovidData]?
    let Liechtenstein: [CovidData]?
    let SriLanka: [CovidData]?
    let Liberia: [CovidData]?
    let Lesotho: [CovidData]?
    let Lithuania: [CovidData]?
    let Luxembourg: [CovidData]?
    let Latvia: [CovidData]?
    let Libya: [CovidData]?
    let Morocco: [CovidData]?
    let Monaco: [CovidData]?
    let Moldova: [CovidData]?
    let Montenegro: [CovidData]?
    let SaintMartinFrenchPart: [CovidData]?
    let Madagascar: [CovidData]?
    let MarshallIslands: [CovidData]?
    let NorthMacedonia: [CovidData]?
    let Mali: [CovidData]?
    let Myanma: [CovidData]?
    let Mongolia: [CovidData]?
    let Macao: [CovidData]?
    let NorthernMarianaIslands: [CovidData]?
    let Martinique: [CovidData]?
    let Mauritania: [CovidData]?
    let Montserrat: [CovidData]?
    let Malta: [CovidData]?
    let Mauritius: [CovidData]?
    let Maldives: [CovidData]?
    let Malawi: [CovidData]?
    let Mexico: [CovidData]?
    let Malaysia: [CovidData]?
    let Mozambique: [CovidData]?
    let Namibia: [CovidData]?
    let NewCaledonia: [CovidData]?
    let Niger: [CovidData]?
    let NorfolkIsland: [CovidData]?
    let Nigeria: [CovidData]?
    let Nicaragua: [CovidData]?
    let Netherlands: [CovidData]?
    let Norway: [CovidData]?
    let Nepal: [CovidData]?
    let Nauru: [CovidData]?
    let Niue: [CovidData]?
    let NewZealand: [CovidData]?
    let Oman: [CovidData]?
    let Panama: [CovidData]?
    let Peru: [CovidData]?
    let FrenchPolynesia: [CovidData]?
    let PapuaNewGuinea: [CovidData]?
    let Philippines: [CovidData]?
    let Pakistan: [CovidData]?
    let Poland: [CovidData]?
    let SaintPierreandMiquelon: [CovidData]?
    let Pitcairn: [CovidData]?
    let PuertoRico: [CovidData]?
    let PalestinianTerritory: [CovidData]?
    let Portugal: [CovidData]?
    let Palau: [CovidData]?
    let Paraguay: [CovidData]?
    let Qatar: [CovidData]?
    let Reunion: [CovidData]?
    let Romania: [CovidData]?
    let Serbia: [CovidData]?
    let Russia: [CovidData]?
    let Rwanda: [CovidData]?
    let SaudiArabia: [CovidData]?
    let SolomonIslands: [CovidData]?
    let Seychelles: [CovidData]?
    let Sudan: [CovidData]?
    let Sweden: [CovidData]?
    let Singapore: [CovidData]?
    let SaintHelenaAscensionandTristanDaCunha: [CovidData]?
    let Slovenia: [CovidData]?
    let SvalbardandJanMayen: [CovidData]?
    let Slovakia: [CovidData]?
    let SierraLeone: [CovidData]?
    let SanMarino: [CovidData]?
    let Senegal: [CovidData]?
    let Somalia: [CovidData]?
    let Suriname: [CovidData]?
    let SouthSudan: [CovidData]?
    let SaoTomeandPrincipe: [CovidData]?
    let ElSalvador: [CovidData]?
    let SintMaartenDutchPart: [CovidData]?
    let SyrianArabRepublic: [CovidData]?
    let Swaziland: [CovidData]?
    let TurksandCaicosIslands: [CovidData]?
    let Chad: [CovidData]?
    let FrenchSouthernTerritories: [CovidData]?
    let Togo: [CovidData]?
    let Tajikistan: [CovidData]?
    let Tokelau: [CovidData]?
    let TimorLeste: [CovidData]?
    let Turkmenistan: [CovidData]?
    let Tunisia: [CovidData]?
    let Tonga: [CovidData]?
    let Turkey: [CovidData]?
    let TrinidadandTobago: [CovidData]?
    let Tuvalu: [CovidData]?
    let Taiwan: [CovidData]?
    let Tanzania: [CovidData]?
    let Ukraine: [CovidData]?
    let Uganda: [CovidData]?
    let UnitedStatesMinorOutlyingIslands: [CovidData]?
    let Uruguay: [CovidData]?
    let Uzbekistan: [CovidData]?
    let HolySee: [CovidData]?
    let SaintVincentandTheGrenadines: [CovidData]?
    let Venezuela: [CovidData]?
    let VirginIslandsBritish: [CovidData]?
    let VirginIslandsUS: [CovidData]?
    let Vietnam: [CovidData]?
    let Vanuatu: [CovidData]?
    let WallisandFutuna: [CovidData]?
    let Samoa: [CovidData]?
    let Kosovo: [CovidData]?
    let Yemen: [CovidData]?
    let Mayotte: [CovidData]?
    let SouthAfrica: [CovidData]?
    let Zambia: [CovidData]?
    let Zimbabwe: [CovidData]?
    let UnitedArabEmirates: [CovidData]?

    enum CodingKeys : String, CodingKey {
        case US
        case Thailand
        case Andorra
        case Afghanistan
        case AntiguaandBarbuda = "Antigua and Barbuda"
        case Anguilla
        case Albania
        case Armenia
        case Angola
        case Antarctica
        case Argentina
        case AmericanSamoa = "American Samoa"
        case Austria
        case Australia
        case Aruba
        case AlandIslands = "Aland Islands"
        case Azerbaijan
        case BosniaandHerzegovina = "Bosnia and Herzegovina"
        case Barbados
        case Bangladesh
        case Belgium
        case BurkinaFaso = "Burkina Faso"
        case Bulgaria
        case Bahrain
        case Burundi
        case Benin
        case SaintBarthelemy = "Saint Barthélemy"
        case Bermuda
        case Brunei
        case Bolivia
        case BonaireSintEustatiusandSaba = "Bonaire, Sint Eustatius and Saba"
        case Brazil
        case Bahamas
        case Bhutan
        case BouvetIsland
        case Botswana
        case Belarus
        case Belize
        case Canada
        case CocosKeelingIslands = "Cocos (Keeling) Islands"
        case CongoKinshasa = "Congo (Kinshasa)"
        case CentralAfricanRepublic = "Central African Republic"
        case Congo
        case Switzerland
        case CotedIvoire = "Cote d'Ivoire"
        case CookIslands = "Cook Islands"
        case Chile
        case Cameroon
        case China
        case Colombia
        case CostaRica = "Costa Rica"
        case Cuba
        case CapeVerde = "Cape Verde"
        case Curaçao
        case ChristmasIsland = "Christmas Island"
        case Cyprus
        case Czechia
        case Germany
        case Djibouti
        case Denmark
        case Dominica
        case DominicanRepublic = "Dominican Republic"
        case CruiseShip = "Cruise Ship"
        case Algeria
        case Ecuador
        case Estonia
        case Egypt
        case WesternSahara = "Western Sahara"
        case Eritrea
        case Spain
        case Ethiopia
        case EuropeanUnion = "European Union"
        case Finland
        case Fiji
        case FalklandIslandsMalvinas = "Falkland Islands (Malvinas)"
        case Micronesia
        case FaroeIslands = "Faroe Islands"
        case France
        case Gabon
        case UnitedKingdom = "United Kingdom"
        case Grenada
        case Georgia
        case FrenchGuiana = "French Guiana"
        case Guernsey
        case Ghana
        case Gibraltar
        case Greenland
        case Gambia
        case Guinea
        case Guadeloupe
        case EquatorialGuinea = "Equatorial Guinea"
        case Greece
        case SouthGeorgia = "South Georgia"
        case Guatemala
        case Guam
        case GuineaBissau = "Guinea-Bissau"
        case Guyana
        case HongKong = "Hong Kong"
        case HeardIslandandMcdonaldIslands = "Heard Island and Mcdonald Islands"
        case Honduras
        case Croatia
        case Haiti
        case Hungary
        case Indonesia
        case Ireland
        case Israel
        case IsleofMan = "Isle of Man"
        case India
        case BritishIndianOceanTerritory = "British Indian Ocean Territory"
        case Iraq
        case Iran
        case Iceland
        case Italy
        case Jersey
        case Jamaica
        case Jordan
        case Japan
        case Kenya
        case Kyrgyzstan
        case Cambodia
        case Kiribati
        case Comoros
        case SaintKittsandNevis = "Saint Kitts and Nevis"
        case NorthKorea = "North Korea"
        case KoreaSouth = "Korea, South"
        case Kuwait
        case CaymanIslands = "Cayman Islands"
        case Kazakhstan
        case LaoPeoplesDemocraticRepublic = "Lao People's Democratic Republic"
        case Lebanon
        case SaintLucia = "Saint Lucia"
        case Liechtenstein
        case SriLanka = "Sri Lanka"
        case Liberia
        case Lesotho
        case Lithuania
        case Luxembourg
        case Latvia
        case Libya
        case Morocco
        case Monaco
        case Moldova
        case Montenegro
        case SaintMartinFrenchPart = "Saint Martin (French Part)"
        case Madagascar
        case MarshallIslands = "Marshall Islands"
        case NorthMacedonia = "North Macedonia"
        case Mali
        case Myanma
        case Mongolia
        case Macao
        case NorthernMarianaIslands = "Northern Mariana Islands"
        case Martinique
        case Mauritania
        case Montserrat
        case Malta
        case Mauritius
        case Maldives
        case Malawi
        case Mexico
        case Malaysia
        case Mozambique
        case Namibia
        case NewCaledonia = "New Caledonia"
        case Niger
        case NorfolkIsland = "Norfolk Island"
        case Nigeria
        case Nicaragua
        case Netherlands
        case Norway
        case Nepal
        case Nauru
        case Niue
        case NewZealand = "New Zealand"
        case Oman
        case Panama
        case Peru
        case FrenchPolynesia = "French Polynesia"
        case PapuaNewGuinea = "Papua New Guinea"
        case Philippines
        case Pakistan
        case Poland
        case SaintPierreandMiquelon = "Saint Pierre and Miquelon"
        case Pitcairn
        case PuertoRico = "Puerto Rico"
        case PalestinianTerritory = "Palestinian Territory"
        case Portugal
        case Palau
        case Paraguay
        case Qatar
        case Reunion
        case Romania
        case Serbia
        case Russia
        case Rwanda
        case SaudiArabia = "Saudi Arabia"
        case SolomonIslands = "Solomon Islands"
        case Seychelles
        case Sudan
        case Sweden
        case Singapore
        case SaintHelenaAscensionandTristanDaCunha = "Helena, Ascension and Tristan Da Cunha"
        case Slovenia
        case SvalbardandJanMayen = "Svalbard and Jan Mayen"
        case Slovakia
        case SierraLeone = "Sierra Leone"
        case SanMarino = "San Marino"
        case Senegal
        case Somalia
        case Suriname
        case SouthSudan = "South Sudan"
        case SaoTomeandPrincipe = "Sao Tome and Principe"
        case ElSalvador = "El Salvador"
        case SintMaartenDutchPart = "Sint Maarten (Dutch Part)"
        case SyrianArabRepublic = "Syrian Arab Republic"
        case Swaziland
        case TurksandCaicosIslands = "Turks and Caicos Islands"
        case Chad
        case FrenchSouthernTerritories = "French Southern Territories"
        case Togo
        case Tajikistan
        case Tokelau
        case TimorLeste = "Timor-Leste"
        case Turkmenistan
        case Tunisia
        case Tonga
        case Turkey
        case TrinidadandTobago = "Trinidad and Tobago"
        case Tuvalu
        case Taiwan = "Taiwan*"
        case Tanzania
        case Ukraine
        case Uganda
        case UnitedStatesMinorOutlyingIslands = "United States Minor Outlying Islands"
        case Uruguay
        case Uzbekistan
        case HolySee = "Holy See"
        case SaintVincentandTheGrenadines = "Saint Vincent and The Grenadines"
        case Venezuela
        case VirginIslandsBritish = "Virgin Islands, British"
        case VirginIslandsUS = "Virgin Islands, U.S."
        case Vietnam
        case Vanuatu
        case WallisandFutuna = "Wallis and Futuna"
        case Samoa
        case Kosovo
        case Yemen
        case Mayotte
        case SouthAfrica = "South Africa"
        case Zambia
        case Zimbabwe
        case UnitedArabEmirates = "United Arab Emirates"
    }
}

struct CovidData: Decodable, Hashable {
    let date: String?
    let confirmed: Int?
    let deaths: Int?
    let recovered: Int?
    
    init(date: String, confirmed: Int, deaths: Int, recovered: Int) {
        self.date = date
        self.confirmed = confirmed
        self.deaths = deaths
        self.recovered = recovered
    }
}

struct GlobalStatisticsFields: Decodable, Hashable {
    let total_cases: Int
    let total_recovered: Int
    let total_unresolved: Int
    let total_deaths: Int
    let total_new_cases_today: Int
    let total_new_deaths_today: Int
    let total_active_cases: Int
    let total_serious_cases: Int
    let total_affected_countries: Int
    
    init(cases: Int, recovered: Int, unresolved: Int, deaths: Int, newCases: Int, newDeaths: Int, activeCases: Int, seriousCases: Int, affectedCountries: Int) {
    
        self.total_cases = cases
        self.total_recovered = recovered
        self.total_unresolved = unresolved
        self.total_deaths = deaths
        self.total_new_cases_today = newCases
        self.total_new_deaths_today = newDeaths
        self.total_active_cases = activeCases
        self.total_serious_cases = seriousCases
        self.total_affected_countries = affectedCountries
    }
            
}

struct GlobalStatistics: Decodable, Hashable {
    let results: [GlobalStatisticsFields]
/*
    init(cases: Int, recovered: Int, unresolved: Int, deaths: Int, newCases: Int, newDeaths: Int, activeCases: Int, seriousCases: Int, affectedCountries: Int) {
        
        self.results =
        [GlobalStatisticsFields(total_cases: cases, total_recovered: recovered, total_unresolved: unresolved, total_deaths: deaths, total_new_cases_today: newCases, total_new_deaths_today: newDeaths, total_active_cases: activeCases, total_serious_cases: seriousCases, total_affected_countries: affectedCountries)]
    }
*/
}

struct NYTimesData: Decodable, Hashable {
    let date: String
    let state: String
    let fips: Int
    let cases: Int
    let deaths: Int
    var newCases: Int
    var newDeaths: Int
    
    init(date: String, state: String, fips: Int, cases: Int, deaths: Int, newCases: Int, newDeaths: Int) {
        self.date = date
        self.state = state
        self.fips = fips
        self.cases = cases
        self.deaths = deaths
        self.newCases = newCases
        self.newDeaths = newDeaths
    }
}

struct VirusTrackerItems: Decodable, Hashable {
    let countrycode: String
    let date: String
    let cases: String
    let deaths: String
    let recovered: String
}

struct VirusTrackerData: Decodable, Hashable {
    let data: [VirusTrackerItems]
    
    init(data: [VirusTrackerItems]) {
        self.data = data
    }
}

struct CountryData: Decodable, Hashable {
    let name: String
    let cases: Int
    let deaths: Int
    
    init(name: String, cases: Int, deaths: Int) {
        self.name = name
        self.cases = cases
        self.deaths = deaths
    }
}

class VirusTrackerViewModel: ObservableObject {
//    @Published var virusTracker: VirusTrackerData = VirusTrackerData(data:[])
    @Published var virusTrackerDataSet: [NYTimesData] = []
    @Published var laTimesDataSet: [LATimesData] = []
    @Published var countyArray: [String] = []
    @Published var dataSet: [String: [CovidData]] = [:]
    var nyTimesArray: [NYTimesData] = []
    var countriesArray: [NYTimesData] = []
    var max = 0
    var countries: [String : String] = [:]
    var countriesSet: Set<String> = []
    var temp: [String] = []
//    @Published var countryArray: [String] = []
    var countryArray: [CountryData] = []
    var startDate: String = ""
    var endDate: String = ""
    var laTimesArray: [LATimesData] = []
    var countySet: Set<String> = []
    var countyMaxDeaths: [String : Double] = [:]
    var countyMaxCases: [String : Double] = [:]
    var countryMaxDeaths: [String : Double] = [:]
    var countryMaxCases: [String : Double] = [:]
    var countiesDeathsTotals: Double = 0
    var countiesCasesTotals: Double = 0
    @Published var globalStats: GlobalStatisticsFields = GlobalStatisticsFields(cases: 0, recovered: 0, unresolved: 0, deaths: 0, newCases: 0, newDeaths: 0, activeCases: 0, seriousCases: 0, affectedCountries: 0)
    @Published var countryArrow: Bool = false
    @Published var casesArrow: Bool = false
    @Published var newCasesArrow: Bool = false
    @Published var deaths: Bool = false
    @Published var deathsArrow: Bool = false
    @Published var newDeathsArrow: Bool = false
    
    init() {
        if countries.count == 0 {
            countries = readJSONFromFile(fileName: "countries")
            fetchData()
        }
    }
    
    func fetchData() {
        
        nyTimesArray.removeAll()
        countriesArray.removeAll()
        countyArray.removeAll()
        
        let urlString = "https://thevirustracker.com/timeline/map-data.json"
    
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let data = try JSONDecoder().decode(VirusTrackerData.self, from: data)
                for i in 0...data.data.count-1 {
                    
                    if let country = self.countries[data.data[i].countrycode] {
                        self.countriesSet.insert(country)
                    }
                    
                    let cases: Int = Int(data.data[i].cases) != nil ? Int(data.data[i].cases)! : 0
                    let deaths: Int = Int(data.data[i].deaths) != nil ? Int(data.data[i].deaths)! : 0
                    let country = data.data[i].countrycode
                    
                    let item = NYTimesData(date: data.data[i].date, state: country, fips: 0, cases: cases, deaths: deaths, newCases: 0, newDeaths: 0)
                    
                    self.countriesArray.append(item)
/*
                    if data.data[i].countrycode == "US" {
                        if let cases = Int(data.data[i].cases) {
                            if cases > 0 {
                                let value = cases
                                if value > self.max {
                                    self.max = value
                                }
                                self.nyTimesArray.append(item)
                            }
                        }
                    }
*/
                    if let s = self.countryMaxDeaths[country] {
                        if  Double(deaths) > s {
                            self.countryMaxDeaths[country] = Double(deaths)
                        }
                    } else {
                        self.countryMaxDeaths[country] = Double(deaths)
                    }
                    if let s = self.countryMaxCases[country] {
                        if  Double(cases) > s {
                            self.countryMaxCases[country] = Double(cases)
                        }
                    } else {
                        self.countryMaxCases[country] = Double(cases)
                    }
                }
                self.temp = Array(self.countriesSet)
                self.temp.sort()
                
                for country in self.temp {
                    var cases = 0
                    var deaths = 0
                    var code: String = ""
                    for (key, value) in self.countries {
                        if value == country {
                            code = key
                        }
                    }
                    if let c = self.countryMaxCases[code] {
                        cases = Int(c)
                    }
                    if let c = self.countryMaxDeaths[code] {
                        deaths = Int(c)
                    }
                    let item = CountryData(name: country, cases: cases, deaths: deaths)
                    self.countryArray.append(item)
                }
//                self.countryArray = self.temp
                
                self.getCountryData(country: "United States", type: "Cases")
/*
                let formatter = DateFormatter()
                formatter.dateFormat = "MM-dd-yyyy"
                self.nyTimesArray.sort{formatter.date(from: $0.date)! < formatter.date(from:$1.date)!}
                
                if let d = self.nyTimesArray.first?.date {
                    self.startDate = d
                }
                
                if let d = self.nyTimesArray.last?.date {
                    self.endDate = d
                }
                
                DispatchQueue.main.async {
                    self.virusTrackerDataSet = self.nyTimesArray
                }
*/
            } catch {
                print("JSON Decode failed, error")
            }
        }.resume()
        
        let urlString2 = "https://api.thevirustracker.com/free-api?global=stats"
        
        guard let url2 = URL(string: urlString2) else {
            fatalError("Invalid URL")
        }
            
        URLSession.shared.dataTask(with: url2) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let data = try JSONDecoder().decode(GlobalStatistics.self, from: data)
                if data.results.count == 1 {
                    let global = data.results[0]
                    
                    DispatchQueue.main.async {
                        self.globalStats = GlobalStatisticsFields(cases: global.total_cases, recovered: global.total_recovered, unresolved: global.total_unresolved, deaths: global.total_deaths, newCases: global.total_new_cases_today, newDeaths: global.total_new_deaths_today, activeCases: global.total_active_cases, seriousCases: global.total_serious_cases, affectedCountries: global.total_affected_countries)
                    }
                }
            } catch {
                print("JSON Decode failed, error")
            }
        }.resume()
        
        let urlString3 = "https://raw.githubusercontent.com/datadesk/california-coronavirus-data/master/latimes-county-totals.csv"
        
        guard let url3 = URL(string: urlString3) else {
            fatalError("Invalid URL")
        }
            
        URLSession.shared.dataTask(with: url3) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            if let htmlContentString = String.init(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                let dataArr = htmlContentString.components(separatedBy: "\n").map({ $0.components(separatedBy: ",") })

                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd"
                let formatter = DateFormatter()
                formatter.dateFormat = "MM-dd-yyyy"
                for row in dataArr
                {
                    if row[0] == "date" {
                        continue
                    }
                    var date: String = ""
                    var county: String = ""
                    var fips: Int = 0
                    var cases: Int = 0
                    var deaths: Int = 0
                    var newCases: Int = 0
                    var newDeaths: Int = 0
                    
                    if row.count > 6 {
                        if let d = df.date(from: row[0]) {
                            date = formatter.string(from: d)
                        }
                        county = row[1]
                        self.countySet.insert(county)
                        if let num = Int(row[2]) {
                            fips = num
                        }
                        if let num = Int(row[3]) {
                            cases = num
                        }
                        if let num = Int(row[4]) {
                            deaths = num
                        }
                        if let num = Int(row[5]) {
                            newCases = num
                        }
                        if let num = Int(row[6]) {
                            newDeaths = num
                        }
                    }
                    
                    if cases == 0 && deaths == 0 {
                        continue
                    }
                        
                    if let s = self.countyMaxDeaths[county] {
                        if  Double(deaths) > s {
                            self.countyMaxDeaths[county] = Double(deaths)
                        }
                    } else {
                        self.countyMaxDeaths[county] = Double(deaths)
                    }
                    if let s = self.countyMaxCases[county] {
                        if  Double(cases) > s {
                            self.countyMaxCases[county] = Double(cases)
                        }
                    } else {
                        self.countyMaxCases[county] = Double(cases)
                    }
                            
                    let item = LATimesData(date: date, county: county, fips: fips, cases: cases, deaths:deaths, newCases: newCases, newDeaths: newDeaths)
                    self.laTimesArray.append(item)

                }
                
                var v = 0.0
                for a in self.countyMaxDeaths {
                    v += a.value
                }
                print(v)
                
                self.countiesDeathsTotals = self.countyMaxDeaths.values.reduce(0) { $0 + $1}
                self.countiesCasesTotals = self.countyMaxCases.values.reduce(0) { $0 + $1}

                DispatchQueue.main.async {
                    self.countyArray = Array(self.countySet)
                    self.countyArray.sort()
                    self.laTimesDataSet = self.laTimesArray
                }
            }
            else {
                print("Could not create html content string from data")
            }

        }.resume()
        
/*
        let urlString4 = "Https://pomber.github.io/covid19/timeseries.json"
        
        guard let url4 = URL(string: urlString4) else {
            fatalError("Invalid URL")
        }
            
        URLSession.shared.dataTask(with: url4) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
        
            do {
                let data = try JSONDecoder().decode(CovidCountries.self, from: data)

                var tempDataSet: [String: [CovidData]] = [:]
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd"
                df.locale = Locale(identifier: "en_US_POSIX")
                df.timeZone = TimeZone(identifier: "UTC")!
                
                for country in pomberCountries {

                    var dataCovid: [CovidData]
                    
                    switch country {
                    case "Andorra":
                        dataCovid = data.Andorra != nil ? data.Andorra! : []
                    case "United Arab Emirates":
                        dataCovid = data.UnitedArabEmirates != nil ? data.UnitedArabEmirates! : []
                    case "Afghanistan":
                        dataCovid = data.Afghanistan != nil ? data.Afghanistan! : []
                    case "Antigua and Barbuda":
                        dataCovid = data.AntiguaandBarbuda != nil ? data.AntiguaandBarbuda! : []
                    case "Anguilla":
                        dataCovid = data.Anguilla != nil ? data.Anguilla! : []
                    case "Albania":
                        dataCovid = data.Albania != nil ? data.Albania! : []
                    case "Armenia":
                        dataCovid = data.Armenia != nil ? data.Armenia! : []
                    case "Angola":
                        dataCovid = data.Angola != nil ? data.Angola! : []
                    case "Antarctica":
                        dataCovid = data.Antarctica != nil ? data.Antarctica! : []
                    case "Argentina":
                        dataCovid = data.Argentina != nil ? data.Argentina! : []
                    case "American Samoa":
                        dataCovid = data.AmericanSamoa != nil ? data.AmericanSamoa! : []
                    case "Austria":
                        dataCovid = data.Austria != nil ? data.Austria! : []
                    case "Australia":
                        dataCovid = data.Australia != nil ? data.Australia! : []
                    case "Aruba":
                        dataCovid = data.Aruba != nil ? data.Aruba! : []
                    case "Åland Islands":
                        dataCovid = data.AlandIslands != nil ? data.AlandIslands! : []
                    case "Azerbaijan":
                        dataCovid = data.Azerbaijan != nil ? data.Azerbaijan! : []
                    case "Bosnia and Herzegovina":
                        dataCovid = data.BosniaandHerzegovina != nil ? data.BosniaandHerzegovina! : []
                    case "Barbados":
                        dataCovid = data.Barbados != nil ? data.Barbados! : []
                    case "Bangladesh":
                        dataCovid = data.Bangladesh != nil ? data.Bangladesh! : []
                    case "Belgium":
                        dataCovid = data.Belgium != nil ? data.Belgium! : []
                    case "Burkina Faso":
                        dataCovid = data.BurkinaFaso != nil ? data.BurkinaFaso! : []
                    case "Bulgaria":
                        dataCovid = data.Bulgaria != nil ? data.Bulgaria! : []
                    case "Bahrain":
                        dataCovid = data.Bahrain != nil ? data.Bahrain! : []
                    case "Burundi":
                        dataCovid = data.Burundi != nil ? data.Burundi! : []
                    case "Benin":
                        dataCovid = data.Benin != nil ? data.Benin! : []
                    case "Saint Barthélemy":
                        dataCovid = data.SaintBarthelemy != nil ? data.SaintBarthelemy! : []
                    case "Bermuda":
                        dataCovid = data.Bermuda != nil ? data.Bermuda! : []
                    case "Brunei":
                        dataCovid = data.Brunei != nil ? data.Brunei! : []
                    case "Bolivia":
                        dataCovid = data.Bolivia != nil ? data.Bolivia! : []
                    case "Bonaire, Sint Eustatius and Saba":
                        dataCovid = data.BonaireSintEustatiusandSaba != nil ? data.BonaireSintEustatiusandSaba! : []
                    case "Brazil":
                        dataCovid = data.Brazil != nil ? data.Brazil! : []
                    case "Bahamas":
                        dataCovid = data.Bahamas != nil ? data.Bahamas! : []
                    case "Bhutan":
                        dataCovid = data.Bhutan != nil ? data.Bhutan! : []
                    case "Bouvet Island":
                        dataCovid = data.BouvetIsland != nil ? data.BouvetIsland! : []
                    case "Botswana":
                        dataCovid = data.Botswana != nil ? data.Botswana! : []
                    case "Belarus":
                        dataCovid = data.Belarus != nil ? data.Belarus! : []
                    case "Belize":
                        dataCovid = data.Belize != nil ? data.Belize! : []
                    case "Canada":
                        dataCovid = data.Canada != nil ? data.Canada! : []
                    case "Cocos (Keeling) Islands":
                        dataCovid = data.CocosKeelingIslands != nil ? data.CocosKeelingIslands! : []
                    case "Congo (Kinshasa)":
                        dataCovid = data.CongoKinshasa != nil ? data.CongoKinshasa! : []
                    case "Central African Republic":
                        dataCovid = data.CentralAfricanRepublic != nil ? data.CentralAfricanRepublic! : []
                    case "Congo":
                        dataCovid = data.Congo != nil ? data.Congo! : []
                    case "Switzerland":
                        dataCovid = data.Switzerland != nil ? data.Switzerland! : []
                    case "Cote d'Ivoire":
                        dataCovid = data.CotedIvoire != nil ? data.CotedIvoire! : []
                    case "Cook Islands":
                        dataCovid = data.CookIslands != nil ? data.CookIslands! : []
                    case "Chile":
                        dataCovid = data.Chile != nil ? data.Chile! : []
                    case "Cameroon":
                        dataCovid = data.Cameroon != nil ? data.Cameroon! : []
                    case "China":
                        dataCovid = data.China != nil ? data.China! : []
                    case "Colombia":
                        dataCovid = data.Colombia != nil ? data.Colombia! : []
                    case "Costa Rica":
                        dataCovid = data.CostaRica != nil ? data.CostaRica! : []
                    case "Cuba":
                        dataCovid = data.Cuba != nil ? data.Cuba! : []
                    case "Cape Verde":
                        dataCovid = data.CapeVerde != nil ? data.CapeVerde! : []
                    case "Curaçao":
                        dataCovid = data.Curaçao != nil ? data.Curaçao! : []
                    case "Christmas Island":
                        dataCovid = data.ChristmasIsland != nil ? data.ChristmasIsland! : []
                    case "Cyprus":
                        dataCovid = data.Cyprus != nil ? data.Cyprus! : []
                    case "Czechia":
                        dataCovid = data.Czechia != nil ? data.Czechia! : []
                    case "Germany":
                        dataCovid = data.Germany != nil ? data.Germany! : []
                    case "Djibouti":
                        dataCovid = data.Djibouti != nil ? data.Djibouti! : []
                    case "Denmark":
                        dataCovid = data.Denmark != nil ? data.Denmark! : []
                    case "Dominica":
                        dataCovid = data.Dominica != nil ? data.Dominica! : []
                    case "Dominican Republic":
                        dataCovid = data.DominicanRepublic != nil ? data.DominicanRepublic! : []
                    case "Cruise Ship":
                        dataCovid = data.CruiseShip != nil ? data.CruiseShip! : []
                    case "Algeria":
                        dataCovid = data.Algeria != nil ? data.Algeria! : []
                    case "Ecuador":
                        dataCovid = data.Ecuador != nil ? data.Ecuador! : []
                    case "Estonia":
                        dataCovid = data.Estonia != nil ? data.Estonia! : []
                    case "Egypt":
                        dataCovid = data.Egypt != nil ? data.Egypt! : []
                    case "Western Sahara":
                        dataCovid = data.WesternSahara != nil ? data.WesternSahara! : []
                    case "Eritrea":
                        dataCovid = data.Eritrea != nil ? data.Eritrea! : []
                    case "Spain":
                        dataCovid = data.Spain != nil ? data.Spain! : []
                    case "Ethiopia":
                        dataCovid = data.Ethiopia != nil ? data.Ethiopia! : []
                    case "European Union":
                        dataCovid = data.EuropeanUnion != nil ? data.EuropeanUnion! : []
                    case "Finland":
                        dataCovid = data.Finland != nil ? data.Finland! : []
                    case "Fiji":
                        dataCovid = data.Fiji != nil ? data.Fiji! : []
                    case "Falkland Islands (Malvinas)":
                        dataCovid = data.FalklandIslandsMalvinas != nil ? data.FalklandIslandsMalvinas! : []
                    case "Micronesia":
                        dataCovid = data.Micronesia != nil ? data.Micronesia! : []
                    case "Faroe Islands":
                        dataCovid = data.FaroeIslands != nil ? data.FaroeIslands! : []
                    case "France":
                        dataCovid = data.France != nil ? data.France! : []
                    case "Gabon":
                        dataCovid = data.Gabon != nil ? data.Gabon! : []
                    case "United Kingdom":
                        dataCovid = data.UnitedKingdom != nil ? data.UnitedKingdom! : []
                    case "Grenada":
                        dataCovid = data.Grenada != nil ? data.Grenada! : []
                    case "Georgia":
                        dataCovid = data.Georgia != nil ? data.Georgia! : []
                    case "French Guiana":
                        dataCovid = data.Guinea != nil ? data.Guinea! : []
                    case "Guernsey":
                        dataCovid = data.Guernsey != nil ? data.Guernsey! : []
                    case "Ghana":
                        dataCovid = data.Ghana != nil ? data.Ghana! : []
                    case "Gibraltar":
                        dataCovid = data.Gibraltar != nil ? data.Gibraltar! : []
                    case "Greenland":
                        dataCovid = data.Greenland != nil ? data.Greenland! : []
                    case "Gambia":
                        dataCovid = data.Gambia != nil ? data.Gambia! : []
                    case "Guinea":
                        dataCovid = data.Guinea != nil ? data.Guinea! : []
                    case "Guadeloupe":
                        dataCovid = data.Guadeloupe != nil ? data.Guadeloupe! : []
                    case "Equatorial Guinea":
                        dataCovid = data.EquatorialGuinea != nil ? data.EquatorialGuinea! :[]
                    case "Greece":
                        dataCovid = data.Greece !=  nil ? data.Greece! : []
                    case "South Georgia":
                        dataCovid = data.Georgia != nil ? data.Georgia! : []
                    case "Guatemala":
                        dataCovid = data.Guatemala != nil ? data.Georgia! : []
                    case "Guam":
                        dataCovid = data.Guam != nil ? data.Guam! : []
                    case "Guinea-Bissau":
                        dataCovid = data.GuineaBissau != nil ? data.GuineaBissau! : []
                    case "Guyana":
                        dataCovid = data.Guyana != nil ? data.Guyana! : []
                    case "Hong Kong":
                        dataCovid = data.HongKong != nil ? data.HongKong! : []
                    case "Heard Island and Mcdonald Islands":
                        dataCovid = data.HeardIslandandMcdonaldIslands != nil ? data.HeardIslandandMcdonaldIslands! : []
                    case "Honduras":
                        dataCovid = data.Honduras != nil ? data.Honduras! : []
                    case "Croatia":
                        dataCovid = data.Croatia != nil ? data.Croatia! : []
                    case "Haiti":
                        dataCovid = data.Haiti != nil ? data.Haiti! : []
                    case "Hungary":
                        dataCovid = data.Hungary != nil ? data.Hungary! : []
                    case "Indonesia":
                        dataCovid = data.Indonesia != nil ? data.Indonesia! : []
                    case "Ireland":
                        dataCovid = data.Ireland != nil ? data.Ireland! : []
                    case "Israel":
                        dataCovid = data.Israel != nil ? data.Israel! : []
                    case "Isle of Man":
                        dataCovid = data.IsleofMan != nil ? data.IsleofMan! : []
                    case "India":
                        dataCovid = data.India != nil ? data.India! : []
                    case "British Indian Ocean Territory":
                        dataCovid = data.BritishIndianOceanTerritory != nil ? data.BritishIndianOceanTerritory! : []
                    case "Iraq":
                        dataCovid = data.Iraq != nil ? data.Iraq! : []
                    case "Iran":
                        dataCovid = data.Iran != nil ? data.Iran! : []
                    case "Iceland":
                        dataCovid = data.Iceland != nil ? data.Iceland! : []
                    case "Italy":
                        dataCovid = data.Italy != nil ? data.Italy! : []
                    case "Jersey":
                        dataCovid = data.Jersey != nil ? data.Jersey! : []
                    case "Jamaica":
                        dataCovid = data.Jamaica != nil ? data.Jamaica! : []
                    case "Jordan":
                        dataCovid = data.Jordan != nil ? data.Jordan! : []
                    case "Japan":
                        dataCovid = data.Japan != nil ? data.Japan! : []
                    case "Kenya":
                        dataCovid = data.Kenya != nil ? data.Kenya! : []
                    case "Kyrgyzstan":
                        dataCovid = data.Kyrgyzstan != nil ? data.Kyrgyzstan! : []
                    case "Cambodia":
                        dataCovid = data.Cambodia != nil ? data.Cambodia! : []
                    case "Kiribati":
                        dataCovid = data.Kiribati != nil ? data.Kiribati! : []
                    case "Comoros":
                        dataCovid = data.Comoros != nil ? data.Comoros! : []
                    case "Saint Kitts and Nevis":
                        dataCovid = data.SaintKittsandNevis != nil ? data.SaintKittsandNevis! : []
                    case "North Korea":
                        dataCovid = data.NorthKorea != nil ? data.NorthKorea! : []
                    case "Korea, South":
                        dataCovid = data.KoreaSouth != nil ? data.KoreaSouth! : []
                    case "Kuwait":
                        dataCovid = data.Kuwait != nil ? data.Kuwait! : []
                    case "Cayman Islands":
                        dataCovid = data.CaymanIslands != nil ? data.CaymanIslands! : []
                    case "Kazakhstan":
                        dataCovid = data.Kazakhstan != nil ? data.Kazakhstan! : []
                    case "Lao People's Democratic Republic":
                        dataCovid = data.LaoPeoplesDemocraticRepublic != nil ? data.LaoPeoplesDemocraticRepublic! : []
                    case "Lebanon":
                        dataCovid = data.Lebanon != nil ? data.Lebanon! : []
                    case "Saint Lucia":
                        dataCovid = data.SaintLucia != nil ? data.SaintLucia! : []
                    case "Liechtenstein":
                        dataCovid = data.Liechtenstein != nil ? data.Liechtenstein! : []
                    case "Sri Lanka":
                        dataCovid = data.SriLanka != nil ? data.SriLanka! : []
                    case "Liberia":
                        dataCovid = data.Liberia != nil ? data.Liberia! : []
                    case "Lesotho":
                        dataCovid = data.Lesotho != nil ? data.Lesotho! : []
                    case "Lithuania":
                        dataCovid = data.Lithuania != nil ? data.Lithuania! : []
                    case "Luxembourg":
                        dataCovid = data.Luxembourg != nil ? data.Luxembourg! : []
                    case "Latvia":
                        dataCovid = data.Latvia != nil ? data.Latvia! : []
                    case "Libya":
                        dataCovid = data.Libya != nil ? data.Libya! : []
                    case "Morocco":
                        dataCovid = data.Morocco != nil ? data.Morocco! : []
                    case "Monaco":
                        dataCovid = data.Monaco != nil ? data.Monaco! : []
                    case "Moldova":
                        dataCovid = data.Moldova != nil ? data.Moldova! : []
                    case "Montenegro":
                        dataCovid = data.Montenegro != nil ? data.Montenegro! : []
                    case "Saint Martin (French Part)":
                        dataCovid = data.SaintMartinFrenchPart != nil ? data.SaintMartinFrenchPart! : []
                    case "Madagascar":
                        dataCovid = data.Madagascar != nil ? data.Madagascar! : []
                    case "Marshall Islands":
                        dataCovid = data.MarshallIslands != nil ? data.MarshallIslands! : []
                    case "North Macedonia":
                        dataCovid = data.NorthMacedonia != nil ? data.NorthMacedonia! : []
                    case "Mali":
                        dataCovid = data.Mali != nil ? data.Mali! : []
                    case "Myanma":
                        dataCovid = data.Myanma != nil ? data.Myanma! : []
                    case "Mongolia":
                        dataCovid = data.Mongolia != nil ? data.Mongolia! : []
                    case "Macao":
                        dataCovid = data.Macao != nil ? data.Macao! : []
                    case "Northern Mariana Islands":
                        dataCovid = data.NorthernMarianaIslands != nil ? data.NorthernMarianaIslands! : []
                    case "Martinique":
                        dataCovid = data.Martinique != nil ? data.Martinique! : []
                    case "Mauritania":
                        dataCovid = data.Mauritania != nil ? data.Mauritania! : []
                    case "Montserrat":
                        dataCovid = data.Montserrat != nil ? data.Montserrat! : []
                    case "Malta":
                        dataCovid = data.Malta != nil ? data.Malta! : []
                    case "Mauritius":
                        dataCovid = data.Mauritius != nil ? data.Mauritius! : []
                    case "Maldives":
                        dataCovid = data.Maldives != nil ? data.Maldives! : []
                    case "Malawi":
                        dataCovid = data.Malawi != nil ? data.Malawi! : []
                    case "Mexico":
                        dataCovid = data.Mexico != nil ? data.Mexico! : []
                    case "Malaysia":
                        dataCovid = data.Malaysia != nil ? data.Malaysia! : []
                    case "Mozambique":
                        dataCovid = data.Mozambique != nil ? data.Mozambique! : []
                    case "Namibia":
                        dataCovid = data.Namibia != nil ? data.Namibia! : []
                    case "New Caledonia":
                        dataCovid = data.NewCaledonia != nil ? data.NewCaledonia! : []
                    case "Niger":
                        dataCovid = data.Niger != nil ? data.Niger! : []
                    case "Norfolk Island":
                        dataCovid = data.NorfolkIsland != nil ? data.NorfolkIsland! : []
                    case "Nigeria":
                        dataCovid = data.Niger != nil ? data.Niger! : []
                    case "Nicaragua":
                        dataCovid = data.Nicaragua != nil ? data.Nicaragua! : []
                    case "Netherlands":
                        dataCovid = data.Netherlands != nil ? data.Netherlands! : []
                    case "Norway":
                        dataCovid = data.Norway != nil ? data.Norway! : []
                    case "Nepal":
                        dataCovid = data.Nepal != nil ? data.Nepal! : []
                    case "Nauru":
                        dataCovid = data.Nauru != nil ? data.Nauru! : []
                    case "Niue":
                        dataCovid = data.Niue != nil ? data.Niue! : []
                    case "New Zealand":
                        dataCovid = data.NewZealand != nil ? data.NewZealand! : []
                    case "Oman":
                        dataCovid = data.Oman != nil ? data.Oman! : []
                    case "Panama":
                        dataCovid = data.Panama != nil ? data.Panama! : []
                    case "Peru":
                        dataCovid = data.Peru != nil ? data.Peru! : []
                    case "French Polynesia":
                        dataCovid = data.FrenchPolynesia != nil ? data.FrenchPolynesia! : []
                    case "Papua New Guinea":
                        dataCovid = data.PapuaNewGuinea != nil ? data.PapuaNewGuinea! : []
                    case "Philippines":
                        dataCovid = data.Philippines != nil ? data.Philippines! : []
                    case "Pakistan":
                        dataCovid = data.Pakistan != nil ? data.Pakistan! : []
                    case "Poland":
                        dataCovid = data.Poland != nil ? data.Poland! : []
                    case "Saint Pierre and Miquelon":
                        dataCovid = data.SaintPierreandMiquelon != nil ? data.SaintPierreandMiquelon! : []
                    case "Pitcairn":
                        dataCovid = data.Pitcairn != nil ? data.Pitcairn! : []
                    case "Puerto Rico":
                        dataCovid = data.PuertoRico != nil ? data.PuertoRico! : []
                    case "Palestinian Territory":
                        dataCovid = data.PalestinianTerritory != nil ? data.PalestinianTerritory! : []
                    case "Portugal":
                        dataCovid = data.Portugal != nil ? data.Portugal! : []
                    case "Palau":
                        dataCovid = data.Palau != nil ? data.Palau! : []
                    case "Paraguay":
                        dataCovid = data.Paraguay != nil ? data.Paraguay! : []
                    case "Qatar":
                        dataCovid = data.Qatar != nil ? data.Qatar! : []
                    case "Réunion":
                        dataCovid = data.Reunion != nil ? data.Reunion! : []
                    case "Romania":
                        dataCovid = data.Romania != nil ? data.Romania! : []
                    case "Serbia":
                        dataCovid = data.Serbia != nil ? data.Serbia! : []
                    case "Russia":
                        dataCovid = data.Russia != nil ? data.Russia! : []
                    case "Rwanda":
                        dataCovid = data.Rwanda != nil ? data.Rwanda! : []
                    case "Saudi Arabia":
                        dataCovid = data.SaudiArabia != nil ? data.SaudiArabia! : []
                    case "Solomon Islands":
                        dataCovid = data.SolomonIslands != nil ? data.SolomonIslands! : []
                    case "Seychelles":
                        dataCovid = data.Seychelles != nil ? data.Seychelles! : []
                    case "Sudan":
                        dataCovid = data.Sudan != nil ? data.Sudan! : []
                    case "Sweden":
                        dataCovid = data.Sweden != nil ? data.Sweden! : []
                    case "Singapore":
                        dataCovid = data.Singapore != nil ? data.Singapore! : []
                    case "Saint Helena, Ascension and Tristan Da Cunha":
                        dataCovid = data.SaintHelenaAscensionandTristanDaCunha != nil ? data.SaintHelenaAscensionandTristanDaCunha! : []
                    case "Slovenia":
                        dataCovid = data.Slovenia != nil ? data.Slovenia! : []
                    case "Svalbard and Jan Mayen":
                        dataCovid = data.SvalbardandJanMayen != nil ? data.SvalbardandJanMayen! : []
                    case "Slovakia":
                        dataCovid = data.Slovakia != nil ? data.Slovakia! : []
                    case "Sierra Leone":
                        dataCovid = data.SierraLeone != nil ? data.SierraLeone! : []
                    case "San Marino":
                        dataCovid = data.SanMarino != nil ? data.SanMarino! : []
                    case "Senegal":
                        dataCovid = data.Senegal != nil ? data.Senegal! : []
                    case "Somalia":
                        dataCovid = data.Somalia != nil ? data.Somalia! : []
                    case "Suriname":
                        dataCovid = data.Suriname != nil ? data.Suriname! : []
                    case "South Sudan":
                        dataCovid = data.SouthSudan != nil ? data.SouthSudan! : []
                    case "Sao Tome and Principe":
                        dataCovid = data.SaoTomeandPrincipe != nil ? data.SaoTomeandPrincipe! : []
                    case "El Salvador":
                        dataCovid = data.ElSalvador != nil ? data.ElSalvador! : []
                    case "Sint Maarten (Dutch Part)":
                        dataCovid = data.SintMaartenDutchPart != nil ? data.SintMaartenDutchPart! : []
                    case "Syrian Arab Republic":
                        dataCovid = data.SyrianArabRepublic != nil ? data.SyrianArabRepublic! : []
                    case "Swaziland":
                        dataCovid = data.Swaziland != nil ? data.Swaziland! : []
                    case "Turks and Caicos Islands":
                        dataCovid = data.TurksandCaicosIslands != nil ? data.TurksandCaicosIslands! : []
                    case "Chad":
                        dataCovid = data.Chad != nil ? data.Chad! : []
                    case "French Southern Territories":
                        dataCovid = data.FrenchSouthernTerritories != nil ? data.FrenchSouthernTerritories! : []
                    case "Togo":
                        dataCovid = data.Togo != nil ? data.Togo! : []
                    case "Thailand":
                        dataCovid = data.Thailand != nil ? data.Thailand! : []
                    case "Tajikistan":
                        dataCovid = data.Tajikistan != nil ? data.Tajikistan! : []
                    case "Tokelau":
                        dataCovid = data.Tokelau != nil ? data.Tokelau! : []
                    case "Timor-Leste":
                        dataCovid = data.TimorLeste != nil ? data.TimorLeste! : []
                    case "Turkmenistan":
                        dataCovid = data.Turkmenistan != nil ? data.Turkmenistan! : []
                    case "Tunisia":
                        dataCovid = data.Tunisia != nil ? data.Tunisia! : []
                    case "Tonga":
                        dataCovid = data.Tonga != nil ? data.Tonga! : []
                    case "Turkey":
                        dataCovid = data.Turkey != nil ? data.Turkey! : []
                    case "Trinidad and Tobago":
                        dataCovid = data.TrinidadandTobago != nil ? data.TrinidadandTobago! : []
                    case "Tuvalu":
                        dataCovid = data.Tuvalu != nil ? data.Tuvalu! : []
                    case "Taiwan*":
                        dataCovid = data.Taiwan != nil ? data.Taiwan! : []
                    case "Tanzania":
                        dataCovid = data.Tanzania != nil ? data.Tanzania! : []
                    case "Ukraine":
                        dataCovid = data.Ukraine != nil ? data.Ukraine! : []
                    case "Uganda":
                        dataCovid = data.Uganda != nil ? data.Uganda! : []
                    case "United States Minor Outlying Islands":
                        dataCovid = data.UnitedStatesMinorOutlyingIslands != nil ? data.UnitedStatesMinorOutlyingIslands! : []
                    case "US":
                        dataCovid = data.US != nil ? data.US! : []
                    case "Uruguay":
                        dataCovid = data.Uruguay != nil ? data.Uruguay! : []
                    case "Uzbekistan":
                        dataCovid = data.Uzbekistan != nil ? data.Uzbekistan! : []
                    case "Holy See":
                        dataCovid = data.HolySee != nil ? data.HolySee! : []
                    case "Saint Vincent and The Grenadines":
                        dataCovid = data.SaintVincentandTheGrenadines != nil ? data.SaintVincentandTheGrenadines! : []
                    case "Venezuela":
                        dataCovid = data.Venezuela != nil ? data.Venezuela! : []
                    case "Virgin Islands, British":
                        dataCovid = data.VirginIslandsBritish != nil ? data.VirginIslandsBritish! : []
                    case "Virgin Islands, U.S.":
                        dataCovid = data.VirginIslandsUS != nil ? data.VirginIslandsUS! : []
                    case "Vietnam":
                        dataCovid = data.Vietnam != nil ? data.Vietnam! : []
                    case "Vanuatu":
                        dataCovid = data.Vanuatu != nil ? data.Vanuatu! : []
                    case "Wallis and Futuna":
                        dataCovid = data.WallisandFutuna != nil ? data.WallisandFutuna! : []
                    case "Samoa":
                        dataCovid = data.Samoa != nil ? data.Samoa! : []
                    case "Kosovo":
                        dataCovid = data.Kosovo != nil ? data.Kosovo! : []
                    case "Yemen":
                        dataCovid = data.Yemen != nil ? data.Yemen! : []
                    case "Mayotte":
                        dataCovid = data.Mayotte != nil ? data.Mayotte! : []
                    case "South Africa":
                        dataCovid = data.SouthAfrica != nil ? data.SouthAfrica! : []
                    case "Zambia":
                        dataCovid = data.Zambia != nil ? data.Zambia! : []
                    case "Zimbabwe":
                        dataCovid = data.Zimbabwe != nil ? data.Zimbabwe! : []
                    default:
                        dataCovid = []
                    }
                    
                    var temp = [CovidData]()
                    
                    for item in dataCovid {
                        let date = item.date != nil ? item.date! : ""
                        let confirmed1 = item.confirmed != nil ? item.confirmed : 0
                        let deaths = item.deaths != nil ? item.deaths! : 0
                        let recovered = item.recovered != nil ? item.recovered! : 0
                        if confirmed1 != 0 || deaths != 0 || recovered != 0 {
                            let t = CovidData.init(date: date, confirmed: confirmed1!, deaths: deaths, recovered: recovered)
                            temp.append(t)
                        }
                    }
                    
                    temp.sort{df.date(from: $0.date!)! > df.date(from: $1.date!)!}
                    tempDataSet[country] = temp
                }
                
                DispatchQueue.main.async {
                    self.dataSet = tempDataSet
                }

            } catch {
                print("JSON Decode failed, error")
            }
        
        }.resume()
*/
    }
    enum SortType {
        case country
        case cases
        case deaths
        case newCases
        case newDeaths
    }
    
    func sort(sortBy: SortType) {
        
        switch sortBy {
        case .country:
            if countryArrow {
                self.countryArray.sort{$0.name < $1.name}
            } else {
                self.countryArray.sort{$0.name > $1.name}
            }
            countryArrow.toggle()
        case .cases:
            if casesArrow {
                self.countryArray.sort{$0.cases < $1.cases}
            } else {
                self.countryArray.sort{$0.cases > $1.cases}
            }
            casesArrow.toggle()
        case .deaths:
            if deathsArrow {
                self.countryArray.sort{$0.deaths < $1.deaths}
            } else {
                self.countryArray.sort{$0.deaths > $1.deaths}
            }
            deathsArrow.toggle()
        case .newCases:
            if newCasesArrow {

            }
            else {

            }
            newCasesArrow.toggle()

        case .newDeaths:
            if newDeathsArrow {

            } else {

            }
            newDeathsArrow.toggle()
        }
        
        DispatchQueue.main.async {

        }
    }
    


    func getCountryData(country: String, type: String) {
        
        self.nyTimesArray.removeAll()
        
        if countryArray.count == 0 {
            return
        }
        
        var c: String = ""
        for (key, value) in countries {
            if value == country {
                c = key
            }
        }

        self.max = 0
        for i in 0...countriesArray.count-1 {
            let a = type == "Deaths" ? countriesArray[i].deaths > 0 : countriesArray[i].cases > 0
            if countriesArray[i].state == c && a {
                let value = type == "Deaths" ? countriesArray[i].deaths : countriesArray[i].cases
                if value > self.max {
                    self.max = value
                }
                self.nyTimesArray.append(countriesArray[i])
            }
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        
        self.nyTimesArray.sort{formatter.date(from: $0.date)! < formatter.date(from:$1.date)!}
        
        var prevCases = nyTimesArray[0].cases
        var prevDeaths = nyTimesArray[0].deaths
        for i in 1...nyTimesArray.count - 1 {
            let newCases = nyTimesArray[i].cases - prevCases
            let newDeaths = nyTimesArray[i].deaths - prevDeaths
            if newCases > 0 {
                nyTimesArray[i].newCases = newCases
            }
            if newDeaths > 0 {
                nyTimesArray[i].newDeaths = newDeaths
            }
            prevCases = nyTimesArray[i].cases
            prevDeaths = nyTimesArray[i].deaths
        }
        
        if let d = self.nyTimesArray.first?.date {
            self.startDate = d
        }
        
        if let d = self.nyTimesArray.last?.date {
            self.endDate = d
        }
        
        DispatchQueue.main.async {
            self.virusTrackerDataSet = self.nyTimesArray
        }

    }
    
    func getCountyData(county: String, type: String) {
            
        self.nyTimesArray.removeAll()
            
//        if countyArray.count == 0 {
//            return
//        }

        for i in 0...laTimesArray.count-1 {
            let a = type == "Deaths" ? laTimesArray[i].deaths > 0 : laTimesArray[i].cases > 0
            if laTimesArray[i].county == county && a {
                let value = type == "Deaths" ? countriesArray[i].deaths : countriesArray[i].cases
                if value > self.max {
                    self.max = value
                }
                let item = NYTimesData(date: laTimesArray[i].date, state: laTimesArray[i].county, fips:
                    laTimesArray[i].fips, cases: laTimesArray[i].cases, deaths: laTimesArray[i].deaths, newCases: laTimesArray[i].newCases, newDeaths: laTimesArray[i].newDeaths)
                    
                self.nyTimesArray.append(item)
            }
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
            
        self.nyTimesArray.sort{formatter.date(from: $0.date)! < formatter.date(from:$1.date)!}
            
        if let d = self.nyTimesArray.first?.date {
            self.startDate = d
        }
            
        if let d = self.nyTimesArray.last?.date {
            self.endDate = d
        }
            
        DispatchQueue.main.async {
            self.virusTrackerDataSet = self.nyTimesArray
        }

    }
     
    func readJSONFromFile(fileName: String) -> [String : String]
    {
        var json: [String : String] = [:]
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try! JSONSerialization.jsonObject(with: data) as! [String : String]
            } catch {
                // Handle error here
            }
        }
        return json
    }
    
}
