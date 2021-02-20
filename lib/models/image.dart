class ImageList {
  ImageList({
    this.id,
    this.images,
  });

  int id;
  final List<dynamic> images;

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
    id: json["id"],
    images: json["profiles"]
  );
}
/////////////////////////
class Img {
  Img({
    this.filePath,
  });

  String filePath;

  factory Img.fromJson(Map<String, dynamic> json) =>
      Img(
    filePath: json["file_path"],
  );
}