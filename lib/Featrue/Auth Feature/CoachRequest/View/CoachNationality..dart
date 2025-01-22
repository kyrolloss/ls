import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/live.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/Widgets/View/ProgressIndicator.dart';

import 'CoachLive.dart';

class CoachNationality extends StatefulWidget {
  const CoachNationality({super.key});

  @override
  State<CoachNationality> createState() => _CoachNationalityState();
}

class _CoachNationalityState extends State<CoachNationality> {
  String? selectedNationality;

  // قائمة الجنسيات
  final List<String> nationalities = [
    "Afghan",
    "Albanian",
    "Algerian",
    "American",
    "Andorran",
    "Angolan",
    "Antiguan",
    "Argentine",
    "Armenian",
    "Australian",
    "Austrian",
    "Azerbaijani",
    "Bahamian",
    "Bahraini",
    "Bangladeshi",
    "Barbadian",
    "Belarusian",
    "Belgian",
    "Belizean",
    "Beninese",
    "Bhutanese",
    "Bolivian",
    "Bosnian",
    "Brazilian",
    "British",
    "Bruneian",
    "Bulgarian",
    "Burkinabe",
    "Burmese",
    "Burundian",
    "Cambodian",
    "Cameroonian",
    "Canadian",
    "Cape Verdean",
    "Central African",
    "Chadian",
    "Chilean",
    "Chinese",
    "Colombian",
    "Comoran",
    "Congolese",
    "Costa Rican",
    "Croatian",
    "Cuban",
    "Cypriot",
    "Czech",
    "Danish",
    "Djiboutian",
    "Dominican",
    "Dutch",
    "East Timorese",
    "Ecuadorean",
    "Egyptian",
    "Emirati",
    "English",
    "Equatorial Guinean",
    "Eritrean",
    "Estonian",
    "Ethiopian",
    "Fijian",
    "Filipino",
    "Finnish",
    "French",
    "Gabonese",
    "Gambian",
    "Georgian",
    "German",
    "Ghanaian",
    "Greek",
    "Grenadian",
    "Guatemalan",
    "Guinean",
    "Guyanese",
    "Haitian",
    "Honduran",
    "Hungarian",
    "Icelander",
    "Indian",
    "Indonesian",
    "Iranian",
    "Iraqi",
    "Irish",
    "Israeli",
    "Italian",
    "Ivorian",
    "Jamaican",
    "Japanese",
    "Jordanian",
    "Kazakh",
    "Kenyan",
    "Kittian",
    "Kuwaiti",
    "Kyrgyz",
    "Laotian",
    "Latvian",
    "Lebanese",
    "Liberian",
    "Libyan",
    "Liechtensteiner",
    "Lithuanian",
    "Luxembourger",
    "Macedonian",
    "Malagasy",
    "Malawian",
    "Malaysian",
    "Maldivian",
    "Malian",
    "Maltese",
    "Marshallese",
    "Mauritanian",
    "Mauritian",
    "Mexican",
    "Micronesian",
    "Moldovan",
    "Monacan",
    "Mongolian",
    "Moroccan",
    "Mosotho",
    "Motswana",
    "Mozambican",
    "Namibian",
    "Nauruan",
    "Nepalese",
    "New Zealander",
    "Nicaraguan",
    "Nigerian",
    "Nigerien",
    "North Korean",
    "Norwegian",
    "Omani",
    "Pakistani",
    "Palauan",
    "Palestinian",
    "Panamanian",
    "Papua New Guinean",
    "Paraguayan",
    "Peruvian",
    "Polish",
    "Portuguese",
    "Qatari",
    "Romanian",
    "Russian",
    "Rwandan",
    "Saint Lucian",
    "Salvadoran",
    "Samoan",
    "San Marinese",
    "Sao Tomean",
    "Saudi",
    "Scottish",
    "Senegalese",
    "Serbian",
    "Seychellois",
    "Sierra Leonean",
    "Singaporean",
    "Slovak",
    "Slovenian",
    "Solomon Islander",
    "Somali",
    "South African",
    "South Korean",
    "Spanish",
    "Sri Lankan",
    "Sudanese",
    "Surinamer",
    "Swazi",
    "Swedish",
    "Swiss",
    "Syrian",
    "Taiwanese",
    "Tajik",
    "Tanzanian",
    "Thai",
    "Togolese",
    "Tongan",
    "Trinidadian",
    "Tunisian",
    "Turkish",
    "Turkmen",
    "Tuvaluan",
    "Ugandan",
    "Ukrainian",
    "Uruguayan",
    "Uzbek",
    "Vanuatuan",
    "Venezuelan",
    "Vietnamese",
    "Welsh",
    "Yemeni",
    "Zambian",
    "Zimbabwean"
  ];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height*0.05 ,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child:  ProgressIndicatorWidget(
                currentStep: 0,
                totalSteps: 5,
                currentPage: 3, // الصفحة الحالية داخل الخطوة
                totalPages: 6, // إجمالي صفحات الخطوة الحالية
                pagesPerStep: [5, 5, 5, 5, 5,5,5], // عدد الصفحات لكل خطوة
                width: screenWidth * 0.33,
              ),
            ),
            // Stack for Background Image and Content
            Stack(
              children: [
                // صورة الخلفية
                Positioned(
                  top: size.height * 0.027,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/Nationalty.png',
                    width: size.width,
                    height: size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
                // محتويات الصفحة
                Column(
                  children: [
                    SizedBox(height: size.height * 0.4), // ترك مساحة للصورة
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.08,
                        vertical: size.height * 0.05,
                      ),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // السؤال
                          Text(
                            "What is your nationality?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.width * 0.06,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          // قائمة اختيار الجنسية
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedNationality,
                                hint: const Text("Select your nationality"),
                                isExpanded: true,
                                items: nationalities.map((String nationality) {
                                  return DropdownMenuItem<String>(
                                    value: nationality,
                                    child: Row(
                                      children: [
                                        Icon(Icons.flag, color: Colors.blue),
                                        SizedBox(width: 10),
                                        Text(nationality),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedNationality = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.2),
                          // زر متابعة
                          ElevatedButton(
                            onPressed: selectedNationality == null
                                ? null
                                : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WhereDidCoachLive(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.3,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: selectedNationality == null
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: size.width * 0.045,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
