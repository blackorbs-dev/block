
import '../../domain/models/quote.dart';
import '../dto/quote_data.dart';

extension QX on QuoteData{
  Quote toQuote() => Quote(
      id: quote.id,
      text: quote.quote,
      author: quote.author,
      category: quote.category
  );
}