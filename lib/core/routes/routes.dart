class Routes {
  /// BASIC ROUTES
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const emptyState = '/empty_state';

  /// AUTHENTICATION ROUTES
  static const authHome = '/auth_home';
  static const signIn = 'signIn';
  static const signUp = 'signUp';

  /// VOTER
  static const voter = '/voter';
  static const registeredVoter = '$voter/registered';

  /// PROFILE ROUTES
  static const profile = '/candidateProfile';
  static const presViceProfile = '$profile/president_vice';
  static const senatorProfile = '$profile/senator';
  static const houseOfRepProfile = '$profile/house_of_Representatives';
  static const partyListProfile = '$profile/party_list';
  static const govViceProfile = '$profile/governor_vice';
  static const provBoardProfile = '$profile/provincial_board_councilors';
  static const mayorViceProfile = '$profile/mayor_vice';
  static const councilorProfile = '$profile/councilor';

  /// CANDIDATE ROUTES
  static const candidate = '/candidate';
  static const myCandidates = '$candidate/my_candidates';
  static const addCandidate = '$candidate/add_new_candidate';
  static const candidateList = '$candidate/list_of_candidates';
  static const selectCandidates = '$candidate/select_candidates';
  static const candidateSearch = '$candidate/search_for_candidate';
  static const candidateTypeSelection = '$candidate/type_selection';
  static const candidatePositionDetails = '$candidate/position_details';

  /// COURSES ROUTES
  static const courses = '/courses';
  static const test = '$courses/test';
  static const mcq = '$test/multiple_choice_questions';

  /// STATISTICS ROUTES
  static const statistics = '/statistics';
  static const chartDetails = '$statistics/chart_details';
}
