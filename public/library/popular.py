from flask import jsonify
from public.conn import db_read
from http import HTTPStatus


def list_popular():

    query = """
    Select 
        c.title AS CourseTitle,
        Count(e.enrollId) As TotalEnrollments
    From 
        courses c
    Left Join
        enroll e
    On
        c.courses_id = e.courses_id
    Group By
        c.courses_id, c.title
    Order By
        TotalEnrollments DESC; 
    """

    result = db_read(query)

    if isinstance(result, tuple) and result[1] == 500:
        return jsonify({"error": result[0]}), HTTPStatus.BAD_REQUEST

    return jsonify(result)


