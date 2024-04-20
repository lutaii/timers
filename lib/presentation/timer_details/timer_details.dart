library timer_details;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timers/data/timer_repository.dart';
import 'package:timers/di/provider_manager.dart';
import 'package:timers/domain/timer_model.dart';
import 'package:timers/domain/timer_type.dart';
import 'package:timers/presentation/timers/timers.dart';
import 'package:timers/presentation/utils/custom_container.dart';
import 'package:timers/themes/app_colors.dart';

part 'widgets/timer_details_screeen.dart';
part 'widgets/description_widget.dart';
part 'widgets/timesheet_widget.dart';
part 'bloc/timesheet_bloc.dart';
part 'bloc/timesheet_event.dart';
part 'bloc/timesheet_state.dart';
part 'widgets/timesheet_tile_widget.dart';
