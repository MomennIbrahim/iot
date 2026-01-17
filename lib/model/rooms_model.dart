class RoomsModel {
  final String image;
  final String name;
  final String activeCount;

  RoomsModel({
    required this.image,
    required this.name,
    required this.activeCount,
  });

  static final List<RoomsModel> rooms = [
    RoomsModel(
      image:
          'https://decormatters-blog-uploads.s3.amazonaws.com/Snapinsta_app_301418438_613445980452829_8758071715934323067_n_1080_b94940bc46.JPG',
      name: 'Living Room',
      activeCount: '4',
    ),
    RoomsModel(
      image:
          'https://www.bhg.com/thmb/MJnq_50vGCcSbJu-00cg35mLyXc=/4000x0/filters:no_upscale():strip_icc()/9-7-2021_DIY1557_2rzlZPlG4qn8OGlvLKSaAc-d851b434a08645e2a594190eadbf7192.jpg',
      name: 'Kitchen Room',
      activeCount: '2',
    ),
    RoomsModel(
      image:
          'https://evolveartisanal.com/wp-content/uploads/2021/07/1_The-Wooden-Rhapsody-Modern-Bedroom-Interior-Design.jpg',
      name: 'Bed Room',
      activeCount: '1',
    ),
    RoomsModel(
      image:
          'https://img.freepik.com/free-photo/modern-bathroom-with-bathtub-double-sink-vanity-smart-home-technology_9975-33078.jpg?semt=ais_hybrid&w=740&q=80',
      name: 'Bath Room',
      activeCount: '1',
    ),
  ];
}
