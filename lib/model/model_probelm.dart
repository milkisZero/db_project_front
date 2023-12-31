class Problem {
  String ptime;
  int pno;
  int plike;
  int pstate;
  int upoint;
  String uname;
  String uid;
  String sname;
  int sid;
  List<String> problem_explain;
  int trycnt;
  int accnt;

  Problem(
      this.ptime,
      this.pno,
      this.plike,
      this.pstate,
      this.upoint,
      this.uname,
      this.uid,
      this.sname,
      this.sid,
      this.problem_explain,
      this.trycnt,
      this.accnt);

  Problem.framMap(Map<String, dynamic> map)
      : ptime = map['ptime'],
        pno = map['pno'],
        plike = map['plike'],
        pstate = map['pstate'],
        upoint = map['upoint'],
        uname = map['uname'],
        uid = map['maker_id'],
        sname = map['sname'],
        sid = map['sid'],
        problem_explain = map['problem_explain'],
        trycnt = map['trycnt'],
        accnt = map['accnt'];

  Problem.fromJson(Map<String, dynamic> json)
      : ptime = json['ptime'],
        pno = json['pno'],
        plike = json['plike'],
        pstate = json['pstate'],
        upoint = json['upoint'],
        uname = json['uname'],
        uid = json['maker_id'],
        sname = json['sname'],
        sid = json['sid'],
        problem_explain = json['problem_explain'].toString().split("?>"),
        trycnt = json['trycnt'],
        accnt = json['accnt'];
}
