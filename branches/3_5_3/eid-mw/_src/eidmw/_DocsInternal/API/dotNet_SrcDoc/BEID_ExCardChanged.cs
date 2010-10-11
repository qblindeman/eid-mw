/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.35
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

namespace be.belgium.eid {

using System;
using System.Runtime.InteropServices;

/// <summary>
/// Exception class Card changed (error code = EIDMW_ERR_CARD_CHANGED).
/// Throw when accessing to a card object but the card has been changed.
/// Used in : 
/// - BEID_Object::checkContextStillOk()
/// </summary>
public class BEID_ExCardChanged : BEID_Exception {
  private HandleRef swigCPtr;

  internal BEID_ExCardChanged(IntPtr cPtr, bool cMemoryOwn) : base(beidlib_dotNetPINVOKE.BEID_ExCardChangedUpcast(cPtr), cMemoryOwn) {
    swigCPtr = new HandleRef(this, cPtr);
  }

  internal static HandleRef getCPtr(BEID_ExCardChanged obj) {
    return (obj == null) ? new HandleRef(null, IntPtr.Zero) : obj.swigCPtr;
  }

  ~BEID_ExCardChanged() {
    Dispose();
  }

  public override void Dispose() {
    lock(this) {
      if(swigCPtr.Handle != IntPtr.Zero && swigCMemOwn) {
        swigCMemOwn = false;
        beidlib_dotNetPINVOKE.delete_BEID_ExCardChanged(swigCPtr);
      }
      swigCPtr = new HandleRef(null, IntPtr.Zero);
      GC.SuppressFinalize(this);
      base.Dispose();
    }
  }

  public BEID_ExCardChanged() : this(beidlib_dotNetPINVOKE.new_BEID_ExCardChanged(), true) {
  }

}

}