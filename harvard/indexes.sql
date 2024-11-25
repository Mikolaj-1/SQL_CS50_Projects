CREATE INDEX "courses_index" ON "courses"("title","department","semester") WHERE "semester" LIKE "%202%";
CREATE INDEX "enrollments_index" ON "enrollments"("student_id","course_id");
CREATE INDEX "satisfies_index" ON "satisfies"("course_id");
