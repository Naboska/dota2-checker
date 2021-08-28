class PlayerInfo {
  late MmrEstimate mmrEstimate;
  String? trackedUntil;
  int? rankTier;
  int? soloCompetitiveRank;
  int? competitiveRank;
  Profile? profile;

  PlayerInfo(
      {required this.trackedUntil,
        required this.rankTier,
        required this.soloCompetitiveRank,
        required this.competitiveRank,
        required this.mmrEstimate,
        required this.profile});

  PlayerInfo.fromJson(Map<String, dynamic> json) {
    trackedUntil = json['tracked_until'];
    rankTier = json['rank_tier'];
    soloCompetitiveRank = json['solo_competitive_rank'];
    competitiveRank = json['competitive_rank'];
    mmrEstimate = MmrEstimate.fromJson(json['mmr_estimate']);
    if (json['profile'] != null) profile = Profile.fromJson(json['profile']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tracked_until'] = trackedUntil;
    data['rank_tier'] = rankTier;
    data['solo_competitive_rank'] = soloCompetitiveRank;
    data['competitive_rank'] = competitiveRank;
    data['mmr_estimate'] = mmrEstimate.toJson();
    if (profile != null) data['profile'] = profile!.toJson();
    return data;
  }
}

class MmrEstimate {
  late int? estimate;

  MmrEstimate({required this.estimate});

  MmrEstimate.fromJson(Map<String, dynamic> json) {
    estimate = json['estimate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['estimate'] = estimate;
    return data;
  }
}

class Profile {
  late int accountId;
  late String personaname;
  late int cheese;
  late String steamid;
  late String avatar;
  late String avatarmedium;
  late String avatarfull;
  late String profileurl;
  late String? lastLogin;
  late String? loccountrycode;
  late bool isContributor;

  Profile(
      {required this.accountId,
        required this.personaname,
        required this.cheese,
        required this.steamid,
        required this.avatar,
        required this.avatarmedium,
        required this.avatarfull,
        required this.profileurl,
        required this.lastLogin,
        required this.loccountrycode,
        required this.isContributor});

  Profile.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    personaname = json['personaname'];
    cheese = json['cheese'];
    steamid = json['steamid'];
    avatar = json['avatar'];
    avatarmedium = json['avatarmedium'];
    avatarfull = json['avatarfull'];
    profileurl = json['profileurl'];
    lastLogin = json['last_login'];
    loccountrycode = json['loccountrycode'];
    isContributor = json['is_contributor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_id'] = accountId;
    data['personaname'] = personaname;
    data['cheese'] = cheese;
    data['steamid'] = steamid;
    data['avatar'] = avatar;
    data['avatarmedium'] = avatarmedium;
    data['avatarfull'] = avatarfull;
    data['profileurl'] = profileurl;
    data['last_login'] = lastLogin;
    data['loccountrycode'] = loccountrycode;
    data['is_contributor'] = isContributor;
    return data;
  }
}
