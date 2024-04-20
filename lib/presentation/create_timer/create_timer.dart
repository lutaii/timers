library create_timer;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timers/data/projects_repository.dart';
import 'package:timers/data/timer_repository.dart';
import 'package:timers/di/provider_manager.dart';
import 'package:timers/domain/project.dart';
import 'package:timers/domain/task.dart';
import 'package:timers/domain/timer_model.dart';
import 'package:timers/domain/timer_type.dart';
import 'package:timers/themes/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/create_timer_screen.dart';
part 'widgets/custom_drop_down.dart';
part 'widgets/button_widget.dart';
part 'bloc/create_timer_bloc.dart';
part 'bloc/create_timer_event.dart';
part 'bloc/create_timer_state.dart';
