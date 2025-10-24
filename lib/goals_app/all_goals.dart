import 'package:flutter/material.dart';
import 'package:flutter_basics_app/goals_app/goal_dialog.dart';
import 'package:flutter_basics_app/goals_app/goal_model.dart';
import 'package:flutter_basics_app/goals_app/hive_servisces.dart';


class GoalsPageNew extends StatefulWidget {
  const GoalsPageNew({super.key});

  @override
  State<GoalsPageNew> createState() => _GoalsPageNewState();
}

class _GoalsPageNewState extends State<GoalsPageNew> {
  final HiveServices _goalService = HiveServices();
  List<GoaLModel> _goals = [];
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final goals = _goalService.getAllGoals();
      setState(() {
        _goals = goals;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load goals: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshGoals() async {
    await _loadGoals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF5E35B1), Color(0xFF7E57C2)],
            ),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'My Goals',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Track Your Progress',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 8),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _buildBody(),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF5E35B1)),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 60, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadGoals,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return Container(
      color: const Color(0xFFF5F5F5),
      child: _goals.isEmpty ? _buildNoGoalsView() : _buildGoalsListView(),
    );
  }

  Widget _buildNoGoalsView() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GoalsSummaryCard(goalsCount: _goals.length),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1E1E1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.flag_outlined,
                      size: 50,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'No Goals Yet',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tap the + button to add your first goal',
                    style: TextStyle(fontSize: 16, color: Color(0xFF9E9E9E)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalsListView() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GoalsSummaryCard(goalsCount: _goals.length),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _goals.length,
              itemBuilder: (context, index) {
                final goal = _goals[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GoalCard(
                    goal: goal,
                    onTap: () => _showEditGoalDialog(goal),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton.extended(
      onPressed: _isLoading ? null : _showAddGoalDialog,
      backgroundColor: const Color(0xFF5E35B1),
      foregroundColor: Colors.white,
      elevation: 6,
      icon: _isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : const Icon(Icons.add, size: 24),
      label: Text(
        _isLoading ? 'Loading...' : 'Add Goal',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  void _showAddGoalDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => GoalDialogNew(
        isEditMode: false,
        onGoalSaved: _refreshGoals,
      ),
    );
  }

  void _showEditGoalDialog(GoaLModel goal) {
    showDialog(
      context: context,
      builder: (dialogContext) => GoalDialogNew(
        isEditMode: true,
        goal: goal,
        onGoalSaved: _refreshGoals,
      ),
    );
  }
}

// ==================== GoalCard Widget ====================
class GoalCard extends StatelessWidget {
  final GoaLModel goal;
  final VoidCallback onTap;

  const GoalCard({
    super.key,
    required this.goal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors:[Colors.green.shade300, Colors.green.shade400]
              ,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                     Icons.check_circle_outline
                        ,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        goal.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration:TextDecoration.lineThrough
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        goal.description,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.white, size: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}

// ==================== GoalsSummaryCard Widget ====================
class GoalsSummaryCard extends StatelessWidget {
  final int goalsCount;

  const GoalsSummaryCard({super.key, required this.goalsCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAF6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF5E35B1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.track_changes,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$goalsCount Goals',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3F51B5),
                ),
              ),
              const Text(
                'Keep pushing forward!',
                style: TextStyle(fontSize: 14, color: Color(0xFF7986CB)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
