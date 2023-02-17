class Blog {
  final String? date, title, description, image;

  Blog({this.date, this.title, this.description, this.image});
}

List<Blog> blogPosts = [
  Blog(
    date: "23 September 2020",
    image: "assets/images/h1.jpg",
    title: "Mère et l'enfant",
    description:
        "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
  ),
  Blog(
    date: "21 August  2020",
    image: "assets/images/h2.jpg",
    title: "Golden",
    description:
        "Web animation has become one of the most exciting web design trends in 2020. It breathes more life into a website and makes user interactions even more appealing and intriguing. Animation for websites allows introducing a brand in an exceptionally creative way in modern digital space. It helps create a lasting impression, make a company",
  ),
  Blog(
    date: "23 September 2020",
    image: "assets/images/h3.jpg",
    title: "Gabiel Trouré",
    description:
        "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
  ),
];
