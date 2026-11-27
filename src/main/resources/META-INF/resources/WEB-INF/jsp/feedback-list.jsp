<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>Feedback Management System</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
               background: #f5f7fa;
               min-height: 100vh; }
        .main-wrapper { padding: 20px; }
        .container { max-width: 1400px; margin: 0 auto; background: white;
                     border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); padding: 40px; }
        h1 { color: #1a202c; margin-bottom: 10px; font-size: 2.5em; text-align: center; font-weight: 700; }
        .header-actions { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        .btn { padding: 12px 24px; border: none; border-radius: 8px; cursor: pointer;
               font-size: 16px; text-decoration: none; display: inline-block; transition: all 0.3s; }
        .btn-primary { background: #2563eb; color: white; font-weight: 600; }
        .btn-primary:hover { background: #1d4ed8; box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3); }
        .btn-success { background: #10b981; color: white; padding: 8px 16px; font-size: 14px; font-weight: 600; }
        .btn-warning { background: #f59e0b; color: white; padding: 8px 16px; font-size: 14px; font-weight: 600; }
        .btn-danger { background: #ef4444; color: white; padding: 8px 16px; font-size: 14px; font-weight: 600; }
        .btn-success:hover { background: #059669; } .btn-warning:hover { background: #d97706; }
        .btn-danger:hover { background: #dc2626; }
        .alert { padding: 15px 18px; margin-bottom: 20px; border-radius: 8px; font-weight: 500; }
        .alert-success { background: #d1fae5; color: #065f46; border: 1px solid #6ee7b7; }
        .alert-error { background: #fee2e2; color: #991b1b; border: 1px solid #fca5a5; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: white; }
        th { background: #f8fafc;
             color: #334155; padding: 15px; text-align: left; font-weight: 700; border-bottom: 2px solid #e2e8f0; }
        td { padding: 14px 15px; border-bottom: 1px solid #e2e8f0; }
        tr:hover { background: #f9fafb; }
        .status-badge { padding: 6px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; display: inline-block; }
        .status-pending { background: #fef3c7; color: #92400e; }
        .status-in-progress { background: #dbeafe; color: #1e40af; }
        .status-solved { background: #d1fae5; color: #065f46; }
        .status-closed { background: #e5e7eb; color: #374151; }
        .category-badge { padding: 6px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; display: inline-block; }
        .actions { display: flex; gap: 8px; }
        .no-feedbacks { text-align: center; padding: 60px 20px; color: #6b7280; font-size: 18px; }
        #modalDocument img { max-width: 100%; max-height: 400px; display: block; margin-top: 10px; border-radius: 8px; }
        #feedbackModal { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%;
                         background: rgba(0, 0, 0, 0.5); z-index: 9999; align-items: center; justify-content: center; }
        .modal-content { background: white; padding: 35px; border-radius: 12px; max-width: 700px; width: 90%;
                         max-height: 90vh; overflow-y: auto; position: relative; box-shadow: 0 20px 25px -5px rgba(0,0,0,0.2); }
        .modal-content h2 { margin-bottom: 25px; color: #1a202c; font-size: 1.5em; font-weight: 700; }
        .modal-content p { margin-bottom: 14px; line-height: 1.7; color: #475569; }
        .modal-content strong { color: #334155; display: inline-block; min-width: 120px; font-weight: 600; }
        .btn-close { margin-top: 25px; padding: 10px 20px; background: #ef4444; color: white; border: none;
                     border-radius: 8px; cursor: pointer; font-weight: 600; transition: all 0.3s; }
        .btn-close:hover { background: #dc2626; }
    </style>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <div class="main-wrapper">
        <div class="container">
            <div class="mb-8">
                <h1 class="text-5xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-indigo-600 via-purple-600 to-pink-600 mb-3 flex items-center justify-center gap-3">
                    <span class="text-5xl">🎫</span>
                    Feedback Management System
                </h1>
                <p class="text-center text-slate-500 text-lg font-medium">Manage and track customer feedback efficiently</p>
            </div>
            <div class="header-actions"><h2 style="color: #475569; font-size: 1.3em; font-weight: 600;">All Feedback</h2></div>

            <c:if test="${not empty success}"><div class="alert alert-success">${success}</div></c:if>
            <c:if test="${not empty error}"><div class="alert alert-error">${error}</div></c:if>

            <c:choose>
                <c:when test="${not empty feedbacks}">
                    <table>
                        <thead>
                            <tr>
                                <th>#</th><th>Customer Name</th><th>Contact</th><th>Email</th>
                                <th>Subject</th><th>Category</th><th>Status</th><th>Created At</th><th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${feedbacks}" var="feedback" varStatus="loop">
                                <tr>
                                    <td>
                                        <span class="open-modal" style="cursor:pointer; color:#2563eb; text-decoration:underline; font-weight: 600;"
                                              data-id="${feedback.id}" data-customer="${feedback.customerName}"
                                              data-contact="${feedback.contactNumber}" data-email="${feedback.email}"
                                              data-subject="${feedback.subject}" data-category="${feedback.category}"
                                              data-status="${feedback.status}"
                                              data-date="<fmt:formatDate value='${feedback.listingDateAsDate}' pattern='MMM dd, yyyy' />"
                                              data-concern="${fn:escapeXml(feedback.concern)}"
                                              data-document="${fn:escapeXml(feedback.documentPath)}">
                                            ${loop.count}
                                        </span>
                                    </td>
                                    <td><strong style="color: #1a202c;">${feedback.customerName}</strong></td>
                                    <td style="color: #64748b;">${feedback.contactNumber}</td>
                                    <td style="color: #64748b;">${feedback.email}</td>
                                    <td style="color: #475569;">${feedback.subject}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${feedback.category == 'FOOD_QUALITY'}">
                                                <span class="category-badge" style="background:#fee2e2;color:#991b1b;">Food Quality Issue</span>
                                            </c:when>
                                            <c:when test="${feedback.category == 'DELIVERY_ISSUE'}">
                                                <span class="category-badge" style="background:#bfdbfe;color:#1e3a8a;">Delivery Issue</span>
                                            </c:when>
                                            <c:when test="${feedback.category == 'ORDER_ACCURACY'}">
                                                <span class="category-badge" style="background:#bbf7d0;color:#065f46;">Wrong or Missing Items</span>
                                            </c:when>
                                            <c:when test="${feedback.category == 'PAYMENT_ISSUE'}">
                                                <span class="category-badge" style="background:#fef3c7;color:#92400e;">Payment / Billing Issue</span>
                                            </c:when>
                                            <c:when test="${feedback.category == 'APP_FEEDBACK'}">
                                                <span class="category-badge" style="background:#e0e7ff;color:#312e81;">App / Website Feedback</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="category-badge" style="background:#f3e8ff;color:#581c87;">General Inquiry</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${feedback.status == 'PENDING'}">
                                                <span class="status-badge status-pending">Pending</span>
                                            </c:when>
                                            <c:when test="${feedback.status == 'IN_PROGRESS'}">
                                                <span class="status-badge status-in-progress">In Progress</span>
                                            </c:when>
                                            <c:when test="${feedback.status == 'SOLVED'}">
                                                <span class="status-badge status-solved">Solved</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge status-closed">Closed</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="color: #64748b;"><fmt:formatDate value="${feedback.listingDateAsDate}" pattern="MMM dd, yyyy" /></td>
                                    <td>
                                        <div class="actions">
                                            <form method="post" action="${pageContext.request.contextPath}/feedbacks/${feedback.id}/solve" style="display:inline;">
                                                <button type="submit" class="btn btn-success action-btn solve-btn" data-id="${feedback.id}"
                                                        ${feedback.status == 'SOLVED' || feedback.status == 'CLOSED' ? 'disabled' : ''}>✓ Solve</button>
                                            </form>
                                            <a href="${pageContext.request.contextPath}/feedbacks/${feedback.id}/edit"
                                               class="btn btn-warning action-btn edit-btn" data-id="${feedback.id}">✏ Edit</a>
                                            <a href="${pageContext.request.contextPath}/feedbacks/${feedback.id}/delete"
                                               class="btn btn-danger action-btn delete-btn" data-id="${feedback.id}"
                                               onclick="return confirm('Are you sure you want to delete this feedback?')">🗑 Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="no-feedbacks">
                        <p>No feedbacks found. Create your first feedback to get started!</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Modal -->
    <div id="feedbackModal">
        <div class="modal-content">
            <h2>Feedback Details</h2>
            <p><strong>Customer Name:</strong> <span id="modalCustomer"></span></p>
            <p><strong>Contact:</strong> <span id="modalContact"></span></p>
            <p><strong>Email:</strong> <span id="modalEmail"></span></p>
            <p><strong>Subject:</strong> <span id="modalSubject"></span></p>
            <p><strong>Category:</strong> <span id="modalCategory"></span></p>
            <p><strong>Status:</strong> <span id="modalStatus"></span></p>
            <p><strong>Created At:</strong> <span id="modalDate"></span></p>
            <p><strong>Concern:</strong> <span id="modalConcern"></span></p>
            <div id="modalDocumentContainer" style="margin-top: 20px;">
                <strong>Document:</strong>
                <div id="modalDocument"></div>
            </div>
            <button onclick="closeModal()" class="btn-close">Close</button>
        </div>
    </div>

    <script>
        const viewedFeedbacks = new Set();

        document.querySelectorAll('.open-modal').forEach(item => {
            item.addEventListener('click', function() {
                // Populate modal
                document.getElementById('modalCustomer').innerText = this.dataset.customer;
                document.getElementById('modalContact').innerText = this.dataset.contact;
                document.getElementById('modalEmail').innerText = this.dataset.email;
                document.getElementById('modalSubject').innerText = this.dataset.subject;
                document.getElementById('modalConcern').innerText = this.dataset.concern;

                const docPath = this.dataset.document;
                const docContainer = document.getElementById('modalDocument');
                docContainer.innerHTML = '';
                if(docPath && docPath.trim() !== '' && docPath !== 'null'){
                    const filename = docPath.split('/').pop().split('\\').pop();
                    const extension = filename.split('.').pop().toLowerCase();
                    const documentUrl = '${pageContext.request.contextPath}/feedbacks/documents/' + encodeURIComponent(filename);
                    if(['jpg','jpeg','png','gif','bmp','webp'].includes(extension)){
                        docContainer.innerHTML = '<img src="'+documentUrl+'" alt="Document Image" />';
                    } else if(extension === 'pdf'){
                        docContainer.innerHTML = '<iframe src="'+documentUrl+'" style="width:100%; height:400px; border:1px solid #ddd; border-radius:8px;" frameborder="0"></iframe>';
                    } else {
                        docContainer.innerHTML = '<a href="'+documentUrl+'" target="_blank" class="btn btn-primary" style="display:inline-block; margin-top:10px;">📄 View Document</a>';
                    }
                } else {
                    docContainer.innerHTML = '<span style="color:#6b7280;">No document attached.</span>';
                }

                const categoryMap = {
                    'FOOD_QUALITY':'Food Quality Issue',
                    'DELIVERY_ISSUE':'Delivery Issue',
                    'ORDER_ACCURACY':'Wrong or Missing Items',
                    'PAYMENT_ISSUE':'Payment / Billing Issue',
                    'APP_FEEDBACK':'App / Website Feedback',
                    'GENERAL_INQUIRY':'General Inquiry'
                };
                document.getElementById('modalCategory').innerText = categoryMap[this.dataset.category] || this.dataset.category;

                const statusMap = {'PENDING':'Pending','IN_PROGRESS':'In Progress','SOLVED':'Solved','CLOSED':'Closed'};
                document.getElementById('modalStatus').innerText = statusMap[this.dataset.status] || this.dataset.status;

                document.getElementById('modalDate').innerText = this.dataset.date;

                // Show modal
                document.getElementById('feedbackModal').style.display = 'flex';

                // Enable buttons for this feedback
                const feedbackId = this.dataset.id;
                viewedFeedbacks.add(feedbackId);
            });
        });

        function closeModal(){
            document.getElementById('feedbackModal').style.display = 'none';
        }
        window.onclick = function(event){
            if(event.target === document.getElementById('feedbackModal')) closeModal();
        }
        document.addEventListener('keydown', function(event){
            if(event.key === 'Escape') closeModal();
        });
    </script>

    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>