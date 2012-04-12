using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SystemCommon;
using System.Data;
using BussinessRules;
using BusinessRules;
using DataAcesss.Entitys;
using DataAcess.Entitys;
using BussinissRule;

namespace Online_Help_Desk.UserControls
{
    public partial class UcRequest : System.Web.UI.UserControl
    {
        private int _userId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //CheckValidPermission();
            }
        }

        private void CheckValidPermission()
        {
            try
            {
                int obj = SysCommon.GetUserIDFromCookie();
                if (obj != 0)
                {
                    _userId = Convert.ToInt32(obj);
                }
                string roleName = UsersBO.CheckPermission(_userId);
                if (roleName.ToLower().Contains(Permission.Facility_Heads))
                {
                    //Load Request Facilitys-Header
                    LoadListFacilityRequest();
                }
                else if (roleName.ToLower().Contains(Permission.Assignees))
                {
                    //Load Request Assigness
                    LoadListAssignessRequest();
                }
                else
                {
                    //Load Request End-Usersd
                    LoadListEnd_UsersdRequest();
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("GetPermission", ex.Message);
            }
        }

        private void LoadListEnd_UsersdRequest()
        {
            try
            {
                Requests request = new Requests();
                request.UserID = _userId;
                request.strWhere = " UserID = " + _userId;
                DataTable dtRequest = RequestsBO.GetByWhere(request);
                Literal lt = new Literal();
                if (dtRequest.Rows.Count > 0)
                {
                    for (int i = 0; i < dtRequest.Rows.Count; i++)
                    {
                        lt.Text = " <li style='width : 50px;'>ID</li>" +
                                "<li>Request Name</li>" +
                                "<li>Facility Name</li>" +
                                "<li>Description</li>" +
                                "<li>Start Date</li>" +
                                "<li>End Date</li>" +
                                "<li>Severity</li> " +
                                "<li class='liFinal'>Status</li>";

                        plhdRowRequest.Controls.Add(lt);
                    } 
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("LoadListEnd_UsersdRequest", ex.Message);
            }
        }

        private void LoadListAssignessRequest()
        {
            try
            {
                Requests request = new Requests();
                request.UserID = _userId;
                request.strWhere = " UserID = " + _userId;
                DataTable dtRequest = RequestsBO.GetByWhere(request);
                Literal lt = new Literal();
                if (dtRequest.Rows.Count > 0)
                {
                    for (int i = 0; i < dtRequest.Rows.Count; i++)
                    {
                        int rID = Convert.ToInt32(dtRequest.Rows[i]["RequestID"]);
                        int StatusID = Convert.ToInt32(dtRequest.Rows[i]["StatusID"]);
                        int SeverityID = Convert.ToInt32(dtRequest.Rows[i]["SeverityID"]);
                        int FacilityID = Convert.ToInt32(dtRequest.Rows[i]["FacilityID"]);
                        string rName = dtRequest.Rows[i]["RequestName"].ToString();
                        string rDescription = dtRequest.Rows[i]["RequestDescription"].ToString();
                        string rStartDate = dtRequest.Rows[i]["StartDate"].ToString();
                        string rEndDate = dtRequest.Rows[i]["EndDate"].ToString();
                        bool status = Convert.ToBoolean(dtRequest.Rows[i]["Status"]);
                        string facilityName = string.Empty;
                        string statusName = string.Empty;
                        string severityName = string.Empty;

                        Status st = new Status();
                        st.StatusID = StatusID;
                        st.strWhere = "StatusID = "+ StatusID;
                        DataTable dtStatus = StatusBO.GetByWhere(st);
                        if (dtStatus.Rows.Count > 0)
                        {
                            statusName = dtStatus.Rows[0]["StatusName"].ToString();
                        }
                        Severitys sv = new Severitys();
                        sv.SeverityID = SeverityID;
                        sv.strWhere = "SeverityID = " + SeverityID;

                        DataTable dtSeveritys = SeveritysBO.GetByWhere(sv);
                        if (dtSeveritys.Rows.Count > 0)
                        {
                            severityName = dtSeveritys.Rows[0]["SeverityName"].ToString();
                        }
                        Facilitys fc = new Facilitys();
                        fc.FacilityID = FacilityID;
                        fc.strWhere = "FacilityID = " + FacilityID;

                        DataTable dtFacilitys = FacilityBO.GetByWhere(fc);
                        if (dtFacilitys.Rows.Count > 0)
                        {
                            facilityName = dtSeveritys.Rows[0]["FacilityName"].ToString();
                        }

                        lt.Text = " <li style='width : 50px;'>"+ rID +"</li>" +
                                    "<li>"+ rName +"</li>" +
                                    "<li>"+ facilityName +"</li>" +
                                    "<li>"+ rDescription +"</li>" +
                                    "<li>"+ rStartDate +"</li>" +
                                    "<li>"+ rEndDate +"</li>" +
                                    "<li>"+ severityName +"</li> " +
                                    "<li class='liFinal'>"+ statusName +"</li>";

                        plhdRowRequest.Controls.Add(lt);
                    }
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("LoadListAssignessRequest", ex.Message);
            }
        }
        private void LoadListFacilityRequest()
        {
            try
            {
                DataTable dtRequest = RequestsBO.GetByAll();


            }
            catch (Exception ex)
            {
                LogError.LogMessage("LoadListRequest", ex.Message);
            }
        }
    }
}