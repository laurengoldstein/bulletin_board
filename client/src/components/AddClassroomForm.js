import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function AddClassroomForm(props) {
  let EMPTY_FORM = {
    classroom_name: "",
    assignment_title: "",
    assignment_desc: "",
  };

  const navigate = useNavigate();

  let [classroomFormData, setClassroomFormData] = useState(EMPTY_FORM);

  function handleChange(event) {
    const value = event.target.value;
    const name = event.target.name;

    setClassroomFormData((state) => ({
      ...state,
      [name]: value,
    }));
  }

  function handleSubmit(event) {
    event.preventDefault();
    props.addClassroomCb(classroomFormData);
    setClassroomFormData(EMPTY_FORM);
    navigate(`/`);
  }

  return (
    <div className="AddTeacherForm">
      <form onSubmit={handleSubmit}>
        <label>
          Classroom Name
          <input
            type="text"
            name="classroom_name"
            value={classroomFormData.classroom_name}
            onChange={(e) => handleChange(e)}
          />
        </label>

        <label>
          Assignment Title
          <input
            type="text"
            name="assignment_title"
            value={classroomFormData.assignment_title}
            onChange={(e) => handleChange(e)}
          />
        </label>

        <label>
          Assignment Description
          <textarea
            type="text"
            name="assignment_desc"
            value={classroomFormData.assignment_desc}
            onChange={(e) => handleChange(e)}
          ></textarea>
        </label>

        <button type="submit" className="btn btn-info">
          Add Classroom
        </button>
      </form>
    </div>
  );
}

export default AddClassroomForm;
