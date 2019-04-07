class Common {
  int count;
  String next;
  String previous;
  List<NamedAPIResource> results;

  Common({this.count, this.next, this.previous, this.results});

  Common.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<NamedAPIResource>();
      json['results'].forEach((v) {
        results.add(new NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'CommonDAO{count: $count, next: $next, previous: $previous, results: $results}';
  }
}

class NamedAPIResource {
  String name;
  String url;

  NamedAPIResource({this.name, this.url});

  NamedAPIResource.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }

  @override
  String toString() {
    return 'Results{name: $name, url: $url}';
  }
}
