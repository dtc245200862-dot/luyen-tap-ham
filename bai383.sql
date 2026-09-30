USE QuanLySinhVien;

-- 1. Hiển thị tất cả thông tin môn học có credit lớn nhất
SELECT *
FROM subject
WHERE credit = (
    SELECT MAX(credit)
    FROM subject
);

-- 2. Hiển thị thông tin môn học có điểm thi lớn nhất
SELECT s.id, s.name, s.credit, MAX(m.mark) AS diem_thi
FROM subject s
JOIN mark m ON s.id = m.subject_id
WHERE m.mark = (
    SELECT MAX(mark)
    FROM mark
)
GROUP BY s.id, s.name, s.credit;

-- 3. Hiển thị thông tin sinh viên và điểm trung bình,
--    xếp theo thứ tự điểm giảm dần
SELECT 
    st.id,
    st.name,
    st.email,
    AVG(m.mark) AS diem_trung_binh
FROM student st
JOIN mark m ON st.id = m.student_id
GROUP BY st.id, st.name, st.email
ORDER BY diem_trung_binh DESC;
