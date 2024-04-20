library timers;

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timers/data/timer_repository.dart';
import 'package:timers/di/provider_manager.dart';
import 'package:timers/domain/timer_model.dart';
import 'package:timers/domain/timer_type.dart';
import 'package:timers/presentation/utils/custom_container.dart';
import 'package:timers/presentation/utils/ticker.dart';

part 'widgets/timers_list_screen.dart';
part 'widgets/timer_widget.dart';
part 'bloc/timers_list/timers_list_bloc.dart';
part 'bloc/timers_list/timers_list_event.dart';
part 'bloc/timers_list/timers_list_state.dart';
part 'bloc/timer/timer_bloc.dart';
part 'bloc/timer/timer_event.dart';
part 'bloc/timer/timer_state.dart';
part 'widgets/emtpy_widget.dart';
part 'widgets/home_screen_app_bar.dart';
