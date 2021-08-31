class PlayerInfo {
  late MmrEstimate mmrEstimate;
  String? trackedUntil;
  int? rankTier;
  int? soloCompetitiveRank;
  int? competitiveRank;
  PlayerInfoProfile? profile;

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
    if (json['profile'] != null) profile = PlayerInfoProfile.fromJson(json['profile']);
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

class PlayerInfoProfile {
  late int accountId;
  late String personaname;
  late int cheese;
  late String? steamid;
  late String? avatar;
  late String? avatarmedium;
  late String? avatarfull;
  late String? profileurl;
  late String? lastLogin;
  late String? loccountrycode;
  late bool isContributor;

  PlayerInfoProfile(
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

  PlayerInfoProfile.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    personaname = json['personaname'] ?? '';
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
}
