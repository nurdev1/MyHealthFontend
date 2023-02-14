class ChangerImageModel{
  String message;
  String image;
  String status;

  ChangerImageModel({
    required this.image,
    required this.message,
    required this.status,
});

  factory ChangerImageModel.fromJson(Map<String, dynamic> json) =>
      ChangerImageModel(
        message: json["message"] ?? "",
        image: json["image"] ?? "",
        status: json["status"] ?? "",
      );

  Map<String, dynamic> toJson() =>{
    "message":message,
    "image":image,
    "status":status,
  };



}