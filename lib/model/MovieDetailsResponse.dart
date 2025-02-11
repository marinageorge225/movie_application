/// status : "ok"
/// status_message : "Query was successful"
/// data : {"movie":{"id":7,"url":"https://yts.mx/movies/101-dalmatians-2-patchs-london-adventure-2002","imdb_code":"tt0324941","title":"101 Dalmatians 2: Patch's London Adventure","title_english":"101 Dalmatians 2: Patch's London Adventure","title_long":"101 Dalmatians 2: Patch's London Adventure (2002)","slug":"101-dalmatians-2-patchs-london-adventure-2002","year":2002,"rating":5.7,"runtime":74,"genres":["Action","Adventure","Animation","Comedy","Family","Musical"],"like_count":48,"description_intro":"Roger, Anita and their canine clan are packing for the big move to Dalmatian Plantation, a home in the country with plenty of room for the 101 pups and far from the clutches of Cruella DeVil. The feistiest pup, Patch, feels lost in a sea of spots and longs to be a one-of-a-kind wonderdog like his TV hero, Thunderbolt. While watching the Thunderbolt Adventure Hour, Patch hears about a chance to appear on the show while it's filming in London. However, the family move will interfere with Patch's opportunity - until he's accidentally left behind in the commotion. Patch heads for the audition to meet his hero. Meanwhile, Thunderbolt's \"trusty\" sidekick, Lightning, reveals that the producers of the show want to replace Thunderbolt with a younger dog. In order to save his job, Thunderbolt decides he will go into the real world and perform an act of true heroism to prove himself. A veritable reference book to Thunderbolt's many adventures, Patch provides the perfect guide for the TV star in his attempts at real-life heroics. As for Cruella DeVil - she's back and more obsessed with Dalmatians than ever. At first, she's able to calm her frenzy through an affiliation with a spot-fixated artist.—Anonymous","description_full":"Roger, Anita and their canine clan are packing for the big move to Dalmatian Plantation, a home in the country with plenty of room for the 101 pups and far from the clutches of Cruella DeVil. The feistiest pup, Patch, feels lost in a sea of spots and longs to be a one-of-a-kind wonderdog like his TV hero, Thunderbolt. While watching the Thunderbolt Adventure Hour, Patch hears about a chance to appear on the show while it's filming in London. However, the family move will interfere with Patch's opportunity - until he's accidentally left behind in the commotion. Patch heads for the audition to meet his hero. Meanwhile, Thunderbolt's \"trusty\" sidekick, Lightning, reveals that the producers of the show want to replace Thunderbolt with a younger dog. In order to save his job, Thunderbolt decides he will go into the real world and perform an act of true heroism to prove himself. A veritable reference book to Thunderbolt's many adventures, Patch provides the perfect guide for the TV star in his attempts at real-life heroics. As for Cruella DeVil - she's back and more obsessed with Dalmatians than ever. At first, she's able to calm her frenzy through an affiliation with a spot-fixated artist.—Anonymous","yt_trailer_code":"S13zxIByQXg","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/large-cover.jpg","torrents":[{"url":"https://yts.mx/torrent/download/6E572E1F3D1E2695DF3E7BFC62552B00DFF6418A","hash":"6E572E1F3D1E2695DF3E7BFC62552B00DFF6418A","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":0,"size":"549.42 MB","size_bytes":576108626,"date_uploaded":"2015-10-31 20:45:36","date_uploaded_unix":1446320736},{"url":"https://yts.mx/torrent/download/6EC1B4C27F8EEE50C1D981C21765D6EFD08F4DD6","hash":"6EC1B4C27F8EEE50C1D981C21765D6EFD08F4DD6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":23,"peers":1,"size":"1.05 GB","size_bytes":1127428915,"date_uploaded":"2015-10-31 20:45:54","date_uploaded_unix":1446320754}],"date_uploaded":"2015-10-31 20:45:36","date_uploaded_unix":1446320736}}
/// @meta : {"server_time":1739237682,"server_timezone":"CET","api_version":2,"execution_time":"0 ms"}

class MovieDetailsResponse {
  MovieDetailsResponse({
      this.status, 
      this.statusMessage, 
      this.data, 
      this.meta,});

  MovieDetailsResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? @meta.fromJson(json['@meta']) : null;
  }
  String? status;
  String? statusMessage;
  Data? data;
  @meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (meta != null) {
      map['@meta'] = meta?.toJson();
    }
    return map;
  }

}

/// server_time : 1739237682
/// server_timezone : "CET"
/// api_version : 2
/// execution_time : "0 ms"

class @meta {
  @meta({
      this.serverTime, 
      this.serverTimezone, 
      this.apiVersion, 
      this.executionTime,});

  @meta.fromJson(dynamic json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }
  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['server_time'] = serverTime;
    map['server_timezone'] = serverTimezone;
    map['api_version'] = apiVersion;
    map['execution_time'] = executionTime;
    return map;
  }

}

/// movie : {"id":7,"url":"https://yts.mx/movies/101-dalmatians-2-patchs-london-adventure-2002","imdb_code":"tt0324941","title":"101 Dalmatians 2: Patch's London Adventure","title_english":"101 Dalmatians 2: Patch's London Adventure","title_long":"101 Dalmatians 2: Patch's London Adventure (2002)","slug":"101-dalmatians-2-patchs-london-adventure-2002","year":2002,"rating":5.7,"runtime":74,"genres":["Action","Adventure","Animation","Comedy","Family","Musical"],"like_count":48,"description_intro":"Roger, Anita and their canine clan are packing for the big move to Dalmatian Plantation, a home in the country with plenty of room for the 101 pups and far from the clutches of Cruella DeVil. The feistiest pup, Patch, feels lost in a sea of spots and longs to be a one-of-a-kind wonderdog like his TV hero, Thunderbolt. While watching the Thunderbolt Adventure Hour, Patch hears about a chance to appear on the show while it's filming in London. However, the family move will interfere with Patch's opportunity - until he's accidentally left behind in the commotion. Patch heads for the audition to meet his hero. Meanwhile, Thunderbolt's \"trusty\" sidekick, Lightning, reveals that the producers of the show want to replace Thunderbolt with a younger dog. In order to save his job, Thunderbolt decides he will go into the real world and perform an act of true heroism to prove himself. A veritable reference book to Thunderbolt's many adventures, Patch provides the perfect guide for the TV star in his attempts at real-life heroics. As for Cruella DeVil - she's back and more obsessed with Dalmatians than ever. At first, she's able to calm her frenzy through an affiliation with a spot-fixated artist.—Anonymous","description_full":"Roger, Anita and their canine clan are packing for the big move to Dalmatian Plantation, a home in the country with plenty of room for the 101 pups and far from the clutches of Cruella DeVil. The feistiest pup, Patch, feels lost in a sea of spots and longs to be a one-of-a-kind wonderdog like his TV hero, Thunderbolt. While watching the Thunderbolt Adventure Hour, Patch hears about a chance to appear on the show while it's filming in London. However, the family move will interfere with Patch's opportunity - until he's accidentally left behind in the commotion. Patch heads for the audition to meet his hero. Meanwhile, Thunderbolt's \"trusty\" sidekick, Lightning, reveals that the producers of the show want to replace Thunderbolt with a younger dog. In order to save his job, Thunderbolt decides he will go into the real world and perform an act of true heroism to prove himself. A veritable reference book to Thunderbolt's many adventures, Patch provides the perfect guide for the TV star in his attempts at real-life heroics. As for Cruella DeVil - she's back and more obsessed with Dalmatians than ever. At first, she's able to calm her frenzy through an affiliation with a spot-fixated artist.—Anonymous","yt_trailer_code":"S13zxIByQXg","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/large-cover.jpg","torrents":[{"url":"https://yts.mx/torrent/download/6E572E1F3D1E2695DF3E7BFC62552B00DFF6418A","hash":"6E572E1F3D1E2695DF3E7BFC62552B00DFF6418A","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":0,"size":"549.42 MB","size_bytes":576108626,"date_uploaded":"2015-10-31 20:45:36","date_uploaded_unix":1446320736},{"url":"https://yts.mx/torrent/download/6EC1B4C27F8EEE50C1D981C21765D6EFD08F4DD6","hash":"6EC1B4C27F8EEE50C1D981C21765D6EFD08F4DD6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":23,"peers":1,"size":"1.05 GB","size_bytes":1127428915,"date_uploaded":"2015-10-31 20:45:54","date_uploaded_unix":1446320754}],"date_uploaded":"2015-10-31 20:45:36","date_uploaded_unix":1446320736}

class Data {
  Data({
      this.movie,});

  Data.fromJson(dynamic json) {
    movie = json['movie'] != null ? Movie.fromJson(json['movie']) : null;
  }
  Movie? movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movie != null) {
      map['movie'] = movie?.toJson();
    }
    return map;
  }

}

/// id : 7
/// url : "https://yts.mx/movies/101-dalmatians-2-patchs-london-adventure-2002"
/// imdb_code : "tt0324941"
/// title : "101 Dalmatians 2: Patch's London Adventure"
/// title_english : "101 Dalmatians 2: Patch's London Adventure"
/// title_long : "101 Dalmatians 2: Patch's London Adventure (2002)"
/// slug : "101-dalmatians-2-patchs-london-adventure-2002"
/// year : 2002
/// rating : 5.7
/// runtime : 74
/// genres : ["Action","Adventure","Animation","Comedy","Family","Musical"]
/// like_count : 48
/// description_intro : "Roger, Anita and their canine clan are packing for the big move to Dalmatian Plantation, a home in the country with plenty of room for the 101 pups and far from the clutches of Cruella DeVil. The feistiest pup, Patch, feels lost in a sea of spots and longs to be a one-of-a-kind wonderdog like his TV hero, Thunderbolt. While watching the Thunderbolt Adventure Hour, Patch hears about a chance to appear on the show while it's filming in London. However, the family move will interfere with Patch's opportunity - until he's accidentally left behind in the commotion. Patch heads for the audition to meet his hero. Meanwhile, Thunderbolt's \"trusty\" sidekick, Lightning, reveals that the producers of the show want to replace Thunderbolt with a younger dog. In order to save his job, Thunderbolt decides he will go into the real world and perform an act of true heroism to prove himself. A veritable reference book to Thunderbolt's many adventures, Patch provides the perfect guide for the TV star in his attempts at real-life heroics. As for Cruella DeVil - she's back and more obsessed with Dalmatians than ever. At first, she's able to calm her frenzy through an affiliation with a spot-fixated artist.—Anonymous"
/// description_full : "Roger, Anita and their canine clan are packing for the big move to Dalmatian Plantation, a home in the country with plenty of room for the 101 pups and far from the clutches of Cruella DeVil. The feistiest pup, Patch, feels lost in a sea of spots and longs to be a one-of-a-kind wonderdog like his TV hero, Thunderbolt. While watching the Thunderbolt Adventure Hour, Patch hears about a chance to appear on the show while it's filming in London. However, the family move will interfere with Patch's opportunity - until he's accidentally left behind in the commotion. Patch heads for the audition to meet his hero. Meanwhile, Thunderbolt's \"trusty\" sidekick, Lightning, reveals that the producers of the show want to replace Thunderbolt with a younger dog. In order to save his job, Thunderbolt decides he will go into the real world and perform an act of true heroism to prove himself. A veritable reference book to Thunderbolt's many adventures, Patch provides the perfect guide for the TV star in his attempts at real-life heroics. As for Cruella DeVil - she's back and more obsessed with Dalmatians than ever. At first, she's able to calm her frenzy through an affiliation with a spot-fixated artist.—Anonymous"
/// yt_trailer_code : "S13zxIByQXg"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/background.jpg"
/// background_image_original : "https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/background.jpg"
/// small_cover_image : "https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/small-cover.jpg"
/// medium_cover_image : "https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/medium-cover.jpg"
/// large_cover_image : "https://yts.mx/assets/images/movies/101_Dalmatians_II_2003/large-cover.jpg"
/// torrents : [{"url":"https://yts.mx/torrent/download/6E572E1F3D1E2695DF3E7BFC62552B00DFF6418A","hash":"6E572E1F3D1E2695DF3E7BFC62552B00DFF6418A","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":0,"size":"549.42 MB","size_bytes":576108626,"date_uploaded":"2015-10-31 20:45:36","date_uploaded_unix":1446320736},{"url":"https://yts.mx/torrent/download/6EC1B4C27F8EEE50C1D981C21765D6EFD08F4DD6","hash":"6EC1B4C27F8EEE50C1D981C21765D6EFD08F4DD6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":23,"peers":1,"size":"1.05 GB","size_bytes":1127428915,"date_uploaded":"2015-10-31 20:45:54","date_uploaded_unix":1446320754}]
/// date_uploaded : "2015-10-31 20:45:36"
/// date_uploaded_unix : 1446320736

class Movie {
  Movie({
      this.id, 
      this.url, 
      this.imdbCode, 
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.slug, 
      this.year, 
      this.rating, 
      this.runtime, 
      this.genres, 
      this.likeCount, 
      this.descriptionIntro, 
      this.descriptionFull, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.torrents, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Movie.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['like_count'] = likeCount;
    map['description_intro'] = descriptionIntro;
    map['description_full'] = descriptionFull;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}

/// url : "https://yts.mx/torrent/download/6E572E1F3D1E2695DF3E7BFC62552B00DFF6418A"
/// hash : "6E572E1F3D1E2695DF3E7BFC62552B00DFF6418A"
/// quality : "720p"
/// type : "bluray"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "2.0"
/// seeds : 2
/// peers : 0
/// size : "549.42 MB"
/// size_bytes : 576108626
/// date_uploaded : "2015-10-31 20:45:36"
/// date_uploaded_unix : 1446320736

class Torrents {
  Torrents({
      this.url, 
      this.hash, 
      this.quality, 
      this.type, 
      this.isRepack, 
      this.videoCodec, 
      this.bitDepth, 
      this.audioChannels, 
      this.seeds, 
      this.peers, 
      this.size, 
      this.sizeBytes, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Torrents.fromJson(dynamic json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['hash'] = hash;
    map['quality'] = quality;
    map['type'] = type;
    map['is_repack'] = isRepack;
    map['video_codec'] = videoCodec;
    map['bit_depth'] = bitDepth;
    map['audio_channels'] = audioChannels;
    map['seeds'] = seeds;
    map['peers'] = peers;
    map['size'] = size;
    map['size_bytes'] = sizeBytes;
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}