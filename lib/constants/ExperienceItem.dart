class ExperienceItem {
  final String compagny;
  final String timeline;
  final List<String> descriptions;
  const ExperienceItem({
    this.compagny,
    this.timeline,
    this.descriptions,
  });
}

const kExperiences = [
  ExperienceItem(
    compagny: 'Développeur web et mobile @AKTO réseau Opcalia',
    timeline: '2 ans de 2019 à 2020',
    descriptions: [
      '- Dolore aliquip dolor commodo excepteur nulla nisi eiusmod anim enim adipisicing occaecat proident et elit.',
      '- Mollit cupidatat quis amet pariatur sint nisi eu enim.',
      '- Nulla enim irure irure aute duis minim exercitation.',
      '- Ut officia et ad sint aliquip ea ullamco.',
    ],
  ),
  ExperienceItem(
    compagny: 'Développeur web et mobile @Forco',
    timeline: '7 ans de 2012 à 2018',
    descriptions: [
      '- Aute nostrud Lorem sint eiusmod reprehenderit culpa.',
      '- Fugiat dolore quis cillum amet enim.',
      '- Anim ea anim irure aliqua qui aliquip laboris incididunt.',
      '- Sit veniam pariatur laborum commodo duis anim mollit enim ad dolor sit est dolor.',
    ],
  ),
  ExperienceItem(
    compagny: 'Développeur web @Immochan',
    timeline: '1 ans en 2011',
    descriptions: [
      '- Aute elit ad elit duis ipsum magna nostrud.',
      '- Ea elit ea do ea commodo Lorem esse eiusmod laborum.',
      '- Nisi mollit pariatur pariatur eiusmod sint ut.',
      '- Ut elit anim labore mollit incididunt incididunt deserunt anim.',
    ],
  ),
  ExperienceItem(
    compagny: 'Chef de projet inforamtique @Armatis',
    timeline: '4 ans de 2007 a 2010',
    descriptions: [
      '- Laborum non aliquip cillum esse irure.',
      '- Ad magna nulla deserunt commodo tempor cillum.',
      '- Sunt ut aliqua ullamco velit.',
      '- Est Lorem irure do eiusmod Lorem mollit incididunt ut cupidatat.',
    ],
  ),
];
