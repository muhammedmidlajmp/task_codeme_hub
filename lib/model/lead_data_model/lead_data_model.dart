class Lead {
  final int id;
  final String source;
  final String createdUser;
  final String assignedUser;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String mobile;
  final String email;
  final dynamic image; // Assuming image can be null or any type
  final String interest;
  final String location;
  final bool isAssigned;
  final String status;
  final String priority;
  final int fkCompany;
  final int createdBy;

  Lead({
    required this.id,
    required this.source,
    required this.createdUser,
    required this.assignedUser,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.mobile,
    required this.email,
    required this.image,
    required this.interest,
    required this.location,
    required this.isAssigned,
    required this.status,
    required this.priority,
    required this.fkCompany,
    required this.createdBy,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      id: json['id'],
      source: json['source'],
      createdUser: json['created_user'],
      assignedUser: json['assigned_user'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
      image: json['image'],
      interest: json['interest'],
      location: json['location'],
      isAssigned: json['is_assigned'],
      status: json['status'],
      priority: json['priority'],
      fkCompany: json['fk_company'],
      createdBy: json['created_by'],
    );
  }
}

class LeadListResponse {
  final bool success;
  final LeadListData data;
  final String message;
  final dynamic errors; // Change the type based on the expected error structure

  LeadListResponse({
    required this.success,
    required this.data,
    required this.message,
    required this.errors,
  });

  factory LeadListResponse.fromJson(Map<String, dynamic> json) {
    return LeadListResponse(
      success: json['success'],
      data: LeadListData.fromJson(json['data']),
      message: json['message'],
      errors: json['errors'],
    );
  }
}

class LeadListData {
  final List<Lead> leads;
  final int totalCount;
  final int totalPage;
  final int nextPageNo;
  final int? previousPageNo;
  final int currentPage;

  LeadListData({
    required this.leads,
    required this.totalCount,
    required this.totalPage,
    required this.nextPageNo,
    required this.previousPageNo,
    required this.currentPage,
  });

  factory LeadListData.fromJson(Map<String, dynamic> json) {
    return LeadListData(
      leads: List<Lead>.from(json['leads'].map((lead) => Lead.fromJson(lead))),
      totalCount: json['total_count'],
      totalPage: json['total_page'],
      nextPageNo: json['next_page_no'],
      previousPageNo: json['previous_page_no'],
      currentPage: json['current_page'],
    );
  }
}
