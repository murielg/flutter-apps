import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
//https://flutter.dev/docs/development/data-and-backend/json
/// This allows the `Article` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'article.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.

@JsonSerializable()

class Article {

  Article(this.text, this.domain, this.by, this.time, this.commentsCount, this.score);

  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'domain')
  String domain;
  @JsonKey(name: 'by')
  String by;
  @JsonKey(name: 'time')
  String time;
  @JsonKey(name: 'score')
  int score;
  @JsonKey(name: 'commentsCount')
  int commentsCount;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

parseArticle(String jsonData) {
  final parsed = jsonDecode(jsonData);
  return Article.fromJson(parsed);
}

List<int> parseTopStories(String jsonData) {
  final parsed = jsonDecode(jsonData);
  return List<int>.from(parsed);

}

final articles = [
  new Article(
    "Circular Shock Acoustic Waves in Ionosphere Triggered by Launch of Formosat‐5",
    "wiley.com",
    "zdw",
    "3 hours",
    177,
    62
  ),
  new Article(
    "BMW says electric car mass production not viable until 2020",
    "reuters.com",
    "Mononokay",
    "2 hours",
    81,
    128,
  ),
  new Article(
     "Evolution Is the New Deep Learning",
     "sentient.ai",
     "jonbaer",
     "4 hours",
     200,
     87,
  ),
  new Article(
     "TCP Tracepoints have arrived in Linux",
     "brendangregg.com",
     "brendangregg",
     "1 hour",
     35,
     0,
  ),
  new Article(

    "Section 230: A Key Legal Shield for Facebook, Google Is About to Change",
     "npr.org",
     "Mononokay",
     "5 hours",
     156,
     66,
  ),
  new Article(
     "A Visiting Star Jostled Our Solar System 70,000 Years Ago",
     "gizmodo.com",
     "rbanffy",
     "7 hours",
     175,
     60,
  ),
  new Article(
     "Cow Game Extracted Facebook Data",
     "theatlantic.com",
     "jameshart",
     "1 hour",
     125,
     56,
  ),
  new Article(
     "Ask HN: How do you find freelance work?",
     "",
     "i_am_nobody",
     "2 hours",
     82,
     43,
  ),
  new Article(

    "Hedge-fund managers that do the most research will post the best returns",
     "cnbc.com",
     "anonu",
     "6 hours",
     149,
     126,
  ),
  new Article(

    "Number systems of the world, sorted by complexity of counting (2006)",
     "airnet.ne.jp",
     "ColinWright",
     "8 hours",
     196,
     90,
  ),
  new Article(
     "MIT’s new device can pull water from desert air",
     "techcrunch.com",
     "evo_9",
     "43 minutes",
     11,
     11,
  ),
  new Article(
     "GitLab 10.6 released with CI/CD for GitHub",
     "gitlab.com",
     "rbanffy",
     "4 hours",
     177,
     62,
  ),
  new Article(
     "Next-Gen Display: MicroLEDs",
     "ieee.org",
     "rbanffy",
     "5 hours",
     72,
     39,
  ),
  new Article(

    "Power 9 May Dent X86 Servers: Alibaba, Google, Tencent Test IBM Systems",
     "eetimes.com",
     "bcaulfield",
     "3 hours",
     52,
     50,
  ),
  new Article(

    "Show HN: Transfer files to mobile device by scanning a QR code from the terminal",
     "github.com",
     "daw___",
     "7 hours",
     143,
     35,
  ),
  new Article(
     "Types of People Startups Should Hire, but Don’t",
     "trifinlabs.com",
     "Shanerostad",
     "1 hour",
     31,
     27,
  ),
  new Article(
     "Steinhaus Longimeter",
     "fairfield.edu",
     "ColinWright",
     "8 hours",
     85,
     16,
  ),
  new Article(

    "Data on 1.2M Facebook users from 2005 (2011) [use archive.org url in thread]",
     "michaelzimmer.org",
     "feelin_googley",
     "1 hour",
     72,
     19,
  ),
  new Article(
     "The Myth of Authenticity Is Killing Tex-Mex",
     "eater.com",
     "samclemens",
     "10 hours",
     121,
     128,
  ),
  new Article(
     "Show HN: Asynchronous HTTP/2 client for Python 2.7",
     "github.com",
     "vsmhn",
     "8 hours",
     75,
     51,
  ),
  new Article(
     "Fractions in the Farey Sequences and the Stern-Brocot Tree",
     "surrey.ac.uk",
     "fanf2",
     "6 hours",
     45,
     7,
  ),
  new Article(
     "Understanding CPU port contention",
     "dendibakh.github.io",
     "matt_d",
     "10 hours",
     96,
     13,
  ),
  new Article(

    "Krita 4.0 – A painting app for cartoonists, illustrators, and concept artists",
     "krita.org",
     "reddotX",
     "9 hours",
     435,
     125,
  ),
  new Article(
     "Cutting ‘Old Heads’ at IBM",
     "propublica.org",
     "mwexler",
     "7 hours",
     287,
     240,
  ),
  new Article(
     "Where to  Classified Ads from Haight-Ashbury",
     "theparisreview.org",
     "tintinnabula",
     "7 hours",
     47,
     12,
  ),
  new Article(

    "TravisBuddy: Adds comments to failed pull requests, tells author what went wrong",
     "github.com",
     "bluzi",
     "8 hours",
     37,
     26,
  ),
  new Article(
     "Using Technical Debt in Your Favor",
     "gitconnected.com",
     "treyhuffine",
     "7 hours",
     140,
     123,
  )
];