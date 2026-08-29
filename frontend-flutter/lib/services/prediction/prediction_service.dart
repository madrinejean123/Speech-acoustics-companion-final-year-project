import '../../models/guess.dart';

abstract class PredictionService {
  Future<List<Guess>> predict({required String precedingText});
}
