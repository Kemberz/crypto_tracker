import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    String id;
    String symbol;
    String name;
    String image;
    double currentPrice;
    double? high24H;
    double? low24H;
    double? priceChange24H;
    double? priceChangePercentage24H;
    double? athChangePercentage;
    double? atl;
    double? atlChangePercentage;
    DateTime? atlDate;
    DateTime? lastUpdated;

    Welcome({
        required this.id,
        required this.symbol,
        required this.name,
        required this.image,
        required this.currentPrice,
        this.high24H,
        this.low24H,
        this.priceChange24H,
        this.priceChangePercentage24H,
        this.athChangePercentage,
        this.atl,
        this.atlChangePercentage,
        this.atlDate,
        this.lastUpdated,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"]?.toDouble(),
        high24H: json["high_24h"].toDouble(),
        low24H: json["low_24h"].toDouble(),
        priceChange24H: json["price_change_24h"]?.toDouble(),
        priceChangePercentage24H: json["price_change_percentage_24h"]?.toDouble(),
        athChangePercentage: json["ath_change_percentage"]?.toDouble(),
        atl: json["atl"]?.toDouble(),
        atlChangePercentage: json["atl_change_percentage"]?.toDouble(),
        atlDate: json["atl_date"] == null ? null : DateTime.parse(json["atl_date"]),
        lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "ath_change_percentage": athChangePercentage,
        "atl": atl,
        "atl_change_percentage": atlChangePercentage,
        "atl_date": atlDate?.toIso8601String(),
        "last_updated": lastUpdated?.toIso8601String(),
    };
}
