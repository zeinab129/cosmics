import 'package:cosmics/core/model/question_model.dart';
import 'package:cosmics/view/widgets/widgets/question_item.dart';

class PlanetsLists {
  static const List<String> planetsName = [
    'Mercury',
    'Venus',
    'Earth',
    'Mars',
    'Jupiter',
    'Saturn',
    'Uranus',
    'Neptune',
  ];

  static const List<String> planetsImage = [
    'mercury',
    'venus',
    'earth',
    'mars',
    'jupiter',
    'saturn',
    'uranus',
    'neptune',
  ];

  static const List<String> planetsInfo = [
    'Mercury is the closest planet to the Sun, and the smallest planet in our solar system - only slightly larger than Earth\'s Moon.  Its surface is covered in tens of thousands of impact craters. Despite its proximity to the Sun, Mercury is not the hottest planet in our solar system – that title belongs to nearby Venus, thanks to its dense atmosphere. But Mercury is the fastest planet, zipping around the Sun every 88 Earth days. Mercury is appropriately named for the swiftest of the ancient Roman gods.',
    'Venus is the second planet from the Sun, and the sixth largest planet. It’s the hottest planet in our solar system. Venus is a cloud-swaddled planet named for a love goddess, and often called Earth’s twin. But pull up a bit closer, and Venus turns hellish. Our nearest planetary neighbor, the second planet from the Sun, has a surface hot enough to melt lead. The atmosphere is so thick that, from the surface, the Sun is just a smear of light.',
    'Earth is our home planet. Scientists believe Earth and its moon formed around the same time as the rest of the solar system. They think that was about 4.5 billion years ago. Earth is the fifth-largest planet in the solar system. Its diameter is about 8,000 miles. And Earth is the third-closest planet to the sun. Its average distance from the sun is about 93 million miles. Only Mercury and Venus are closer. Earth is the only planet known to have large amounts of liquid water. Liquid water is essential for life. Earth is the only planet where life is known to exist.',
    'Mars is the fourth planet from the Sun, and the seventh largest. It’s the only planet we know of inhabited entirely by robots. Mars is no place for the faint-hearted. It’s dry, rocky, and bitter cold. Mars, is one of Earth\'s two closest planetary neighbors (Venus is the other). Mars is one of the easiest planets to spot in the night sky – it looks like a bright red point of light',
    'Jupiter is the fifth planet from the Sun, and the largest in the solar system – more than twice as massive as the other planets combined. Jupiter also is the oldest planet, forming from the dust and gases left over from the Sun\'s formation 4.5 billion years ago. But it has the shortest day in the solar system, taking only 10.5 hours to spin around once on its axis.',
    'Saturn is the sixth planet from the Sun, and the second largest in the solar system. It’s surrounded by beautiful rings. Saturn is a massive ball made mostly of hydrogen and helium. The farthest planet from Earth discovered by the unaided human eye, Saturn has been known since ancient times. The planet is named for the Roman god of agriculture and wealth, who was also the father of Jupiter.',
    'Uranus is the seventh planet from the Sun, and the third largest planet in our solar system. It appears to spin sideways. Uranus is a very cold and windy planet. It is surrounded by faint rings, and more than two dozen small moons as it rotates at a nearly 90-degree angle from the plane of its orbit.  This unique tilt makes Uranus appear to spin on its side. Uranus is blue-green in color due to large amounts of methane, which absorbs red light but allows blues to be reflected back into space.',
    'Neptune is the eighth, and most distant planet from the Sun. It’s the fourth-largest, and the first planet discovered with math. The planet’s blue color comes from methane in its atmosphere, which absorbs red wavelengths of light, but allows blue ones to be reflected back into space – very much like its neighbor, Uranus. Neptune was the first planet located using math. German astronomer Johann Galle was the first to observe the planet in 1846. The planet is named after the Roman god of the sea.',
  ];

  static const List<String> planetsMass = [
    '3.2',
    '4.8',
    '5.9',
    '6.3',
    '1.8',
    '5.6',
    '8.6',
    '1.0',
  ];

  static const List<String> planetsMassPower = [
    '23',
    '24',
    '24',
    '23',
    '27',
    '26',
    '25',
    '26',
  ];

  static const List<String> planetsGrav = [
    '3.7',
    '8.8',
    '9.8',
    '3.7',
    '24.7',
    '10.4',
    '8.8',
    '11.1',
  ];

  static const List<String> planetsDay = [
    '1,408',
    '5,832',
    '24',
    '24, 37m',
    '9, 56m',
    '10, 34m',
    '17, 14m',
    '16, 6m',
  ];

  static const List<String> planetsVelo = [
    '4.2',
    '10.3 ',
    '10.3 ',
    '5.0',
    '59.5',
    '35.5',
    '21.3',
    '23.5',
  ];

  static const List<String> planetsTemp = [
    '167',
    '464',
    '15',
    '-65',
    '-110',
    '-140',
    '-195',
    '-200',
  ];

  static const List<String> planetsDis = [
    '58',
    '108.2',
    '149.6',
    '227.9',
    '778.5',
    '1.4',
    '2.8',
    '4.4 ',
  ];

  static const List<String> planetsDisPower = [
    '6',
    '6',
    '6',
    '6',
    '6',
    '9',
    '9',
    '9',
  ];

  static List<List<QuestionModel>> questions = [
    [
      QuestionModel(
          question: "Arrangement of Mercury in the solar system:",
          choices: ["First", "Second", "Third"],
          trueChoice: 1),
      QuestionModel(
          question: "Mercury is zipping around the sun every...",
          choices: ["365 Earth days", "88 Earth days", "165 Earth days"],
          trueChoice: 2),
      QuestionModel(
          question: "Mercury mean temperature(C) ...",
          choices: ["167", "15", "-52"],
          trueChoice: 1),
      QuestionModel(
          question: "The day of Mercury (in hours) ...",
          choices: ["1208", "24", "1408"],
          trueChoice: 3)
    ],
    [
      QuestionModel(
          question: "Venus is the ... largest planet in our solar system.",
          choices: ["Second", "Fourth", "Sixth"],
          trueChoice: 3),
      QuestionModel(
          question: "The velocity of Venus (in km/s) ... ",
          choices: ["4.2", "5.0", "10.3"],
          trueChoice: 3),
      QuestionModel(
          question: "The day of Venus (in hours) ...",
          choices: ["1408", "5832", "2853"],
          trueChoice: 2),
      QuestionModel(
          question: "Venus is the ... planet in the solar system.",
          choices: ["Hottest", "Coldest", "Non of the above"],
          trueChoice: 1)
    ],
    [
      QuestionModel(
          question: "Earth is the ... largest planet in the solar system.",
          choices: ["Second", "Third", "Fifth"],
          trueChoice: 3),
      QuestionModel(
          question: "The mean temperature of the Earth (C)",
          choices: ["-110", "15", "464"],
          trueChoice: 2),
      QuestionModel(
          question: "The gravity of the Earth = ... m/s2",
          choices: ["9.8", "8.8", "3.8"],
          trueChoice: 1),
      QuestionModel(
          question:
              "The distance between our home Earth and the Sun ... (10(6)km)",
          choices: ["58", "778.5", "149.6"],
          trueChoice: 3)
    ],
    [
      QuestionModel(
          question: "Mars looks like ...",
          choices: [
            "A bright red point of light.",
            "A tiny, faint blue-green disk.",
            "Faint stripes, jet streams, and storms"
          ],
          trueChoice: 1),
      QuestionModel(
          question: "Mars mean temperature ... (C)",
          choices: ["15", "-65", "35"],
          trueChoice: 2),
      QuestionModel(
          question: "The velocity of Mars ... (km/s)",
          choices: ["5.0", "10.3", "4.2"],
          trueChoice: 1),
      QuestionModel(
          question: "Mars is the ... planet from the Sun.",
          choices: ["Second", "First", "Fourth"],
          trueChoice: 3)
    ],
    [
      QuestionModel(
          question: "Jupiter is forming from ...",
          choices: ["Ice and water", "Dust and gasses", "Fire and flames"],
          trueChoice: 2),
      QuestionModel(
          question:
              "Jupiter has the shortest day of all planets, its day lasts only ... ",
          choices: ["8h 52m", "6h 30m", "9h 56m"],
          trueChoice: 3),
      QuestionModel(
          question: "The mean temperature of Jupiter is ... (C).",
          choices: ["-110", "15", "-65"],
          trueChoice: 1),
      QuestionModel(
          question: "Distance between the Sun and Jupiter is ... (10(6)km)",
          choices: ["227.9", "108.2", "778.5"],
          trueChoice: 3)
    ],
    [
      QuestionModel(
          question: "Saturn is the ... largest in the solar system.",
          choices: ["Second", "Third", "Forth"],
          trueChoice: 1),
      QuestionModel(
          question: "Saturn is a massive ball made of ...",
          choices: [
            "Nitrogen and Oxygen",
            "Carbon dioxide and Methane",
            "Hydrogen and Helium"
          ],
          trueChoice: 3),
      QuestionModel(
          question: "Saturn is named for the Roman god of ...",
          choices: [
            "Wisdom and justice",
            "Agriculture and wealth",
            "Fire and deserts"
          ],
          trueChoice: 2),
      QuestionModel(
          question: "The day of Saturn ... in hours",
          choices: ["10h 34m", "24h", "9h 56m"],
          trueChoice: 1),
      QuestionModel(
          question: "The gravity of Saturn = ... (m/s(2))",
          choices: ["24.7", "9.8", "10.4"],
          trueChoice: 3)
    ],
    [
      QuestionModel(
          question:
              "Uranus is the ... planet of the Sun, and the ... largest planet in our solar system.",
          choices: ["Second, forth", "Seventh, third", "Fifth, second"],
          trueChoice: 2),
      QuestionModel(
          question:
              "Saturn rotates at a nearly ... degree sngle from the plane of its orbit.",
          choices: ["90", "45", "60"],
          trueChoice: 1),
      QuestionModel(
          question: 'The color of Saturn planet is ...',
          choices: ["Red-yellow", "Green-blue", "Blue-green"],
          trueChoice: 3),
      QuestionModel(
          question: "Saturn contains a large amounts of ...",
          choices: ["Methane", "Helium", "Oxygen"],
          trueChoice: 1),
      QuestionModel(
          question: "The day of Uranus ... in hours.",
          choices: ["24h", "10h 56m", "17h 14m"],
          trueChoice: 3)
    ],
    [
      QuestionModel(
          question: "Neptune is the first planet discovered with ...",
          choices: ["Math", "Robots", "Telescope"],
          trueChoice: 1),
      QuestionModel(
          question: "Neptune is named after the Roman god of ...",
          choices: ["War", "Love", "Sea"],
          trueChoice: 3),
      QuestionModel(
          question: "The mean temperature of Neptune is ... (C)",
          choices: ["15", "-200", "-110"],
          trueChoice: 2),
      QuestionModel(
          question: "The atmosphere of Neptune absorbs the ...",
          choices: [
            "Red wavelengths of light.",
            "Blue wavelengths of light.",
            "Green wavelengths of light."
          ],
          trueChoice: 1)
    ]
  ];
}
