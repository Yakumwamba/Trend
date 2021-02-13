class CurrentPlayingModel {
  String artist;
  String title;
  String album;
  String endTime;
  String startTime;
  String nextTrackStart;
  double durationSeconds;
  String coverImage;
  CurrentPlayingModel(
      {this.artist,
      this.title,
      this.album,
      this.endTime,
      this.durationSeconds,
      this.coverImage,
      this.startTime,
      this.nextTrackStart});

  CurrentPlayingModel.fromJson(Map<String, dynamic> json) {
    this.artist = json['artist'];
    this.title = json['title'];
    this.album = json['album'];
    this.endTime = json['end_at'];
    this.startTime = json['started_at'];
    this.nextTrackStart = json['next_track'];
    this.durationSeconds = json['duration'];
    this.coverImage = json['cover'];
  }
}
// {"artist":null,"title":"Zambezi feat Nasty D","album":null,"started_at":"2021-02-11T14:47:49+0000","end_at":"2021-02-11T14:51:34+0000","next_track":"2021-02-11T14:51:35+0000","duration":224.50,"buy_link":null,"is_live":false,"cover":"https://www.radioking.com/api/track/cover/863e45be-ebe6-4127-a23e-82da0ce173ce","default_cover":true,"forced_title":false}
